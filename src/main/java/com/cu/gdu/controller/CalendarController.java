package com.cu.gdu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cu.gdu.service.CalendarService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/calendar")
@RequiredArgsConstructor
@Slf4j
@Controller
public class CalendarController {
	private final CalendarService calendarService;

}
