/*******************************************************************************
 *     Cloud Foundry 
 *     Copyright (c) [2009-2016] Pivotal Software, Inc. All Rights Reserved.
 *
 *     This product is licensed to you under the Apache License, Version 2.0 (the "License").
 *     You may not use this product except in compliance with the License.
 *
 *     This product includes a number of subcomponents with
 *     separate copyright notices and license terms. Your use of these
 *     subcomponents is subject to the terms and conditions of the
 *     subcomponent's license, as noted in the LICENSE file.
 *******************************************************************************/
package org.cloudfoundry.identity.uaa.resources;

import com.jayway.jsonpath.JsonPath;
import org.cloudfoundry.identity.uaa.util.JsonUtils;
import org.springframework.util.Assert;

import java.util.*;

public class SearchResultsFactory {
    public static <T> SearchResults<Map<String, Object>> cropAndBuildSearchResultFrom(
        List<T> input,
        int startIndex,
        int count,
        int total,
        String[] attributes,
        List<String> schemas)  {

        if (startIndex <= 0) {
            //must start with 1
            startIndex = 1;
        }
        if ( (startIndex -1) >= input.size() ) {
            //start index is past the last result
            count = 0;
        }
        if ( ((startIndex-1)+count) >= input.size()) {
            //we're past the last result
            count = input.size() - (startIndex - 1);
        }

        input = count>0 ? input.subList(startIndex-1, startIndex-1+count) : Collections.<T>emptyList();

        return buildSearchResultFrom(
            input,
            startIndex,
            count,
            total,
            attributes,
            new SimpleAttributeNameMapper(Collections.<String, String> emptyMap()),
            schemas);

    }


    public static <T> SearchResults<Map<String, Object>> buildSearchResultFrom(
        List<T> input,
        int startIndex,
        int count,
        int total,
        String[] attributes,
        List<String> schemas)  {

        return buildSearchResultFrom(
            input,
            startIndex,
            count,
            total,
            attributes,
            new SimpleAttributeNameMapper(Collections.<String, String> emptyMap()),
            schemas);

    }

    public static <T> SearchResults<Map<String, Object>> buildSearchResultFrom(
        List<T> input,
        int startIndex,
        int count,
        int total,
        String[] attributes,
        AttributeNameMapper mapper,
        List<String> schemas) {

        Assert.state(input.size() <= count,
                        "Cannot build search results from parent list. Use subList before you call this method.");
        Collection<Map<String, Object>> results = new ArrayList<Map<String, Object>>();
        for (T object : input) {
            Map<String, Object> map = new LinkedHashMap<String, Object>();
            String serializedObject = JsonUtils.writeValueAsString(object);
            for (String attribute : attributes) {
                String jsonPath = "$." + mapper.mapToInternal(attribute);
                Object value = JsonPath.read(serializedObject, jsonPath);
                map.put(attribute, value);
            }
            results.add(map);
        }

        return new SearchResults<>(schemas, results, startIndex, count, total);
    }
}
