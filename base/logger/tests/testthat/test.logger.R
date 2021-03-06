## -------------------------------------------------------------------------------
##  Copyright (c) 2012 University of Illinois, NCSA.
##  All rights reserved. This program and the accompanying materials
##  are made available under the terms of the 
##  University of Illinois/NCSA Open Source License
##  which accompanies this distribution, and is available at
##  http://opensource.ncsa.illinois.edu/license.html
##-------------------------------------------------------------------------------

context("Testing Logger Settings")
test_that("logger prints right messages, responds correctly to logger.setLevel",{

  logger.setUseConsole(TRUE, FALSE)

  logger.setLevel("ALL")
  expect_equal(logger.getLevel(), "ALL")
  expect_output(logger.debug("message"), "DEBUG  \\[.*\\] : message")
  expect_output(logger.info("message"),  "INFO   \\[.*\\] : message")
  expect_output(logger.warn("message"),  "WARN   \\[.*\\] : message")
  expect_output(logger.error("message"), "ERROR  \\[.*\\] : message")

  logger.setLevel("DEBUG")
  expect_equal(logger.getLevel(), "DEBUG")
  expect_output(logger.debug("message"), "DEBUG  \\[.*\\] : message")
  expect_output(logger.info("message"),  "INFO   \\[.*\\] : message")
  expect_output(logger.warn("message"),  "WARN   \\[.*\\] : message")
  expect_output(logger.error("message"), "ERROR  \\[.*\\] : message")

  logger.setLevel("INFO")
  expect_equal(logger.getLevel(), "INFO")
  expect_silent(logger.debug("message"))
  expect_output(logger.info("message"),  "INFO   \\[.*\\] : message")
  expect_output(logger.warn("message"),  "WARN   \\[.*\\] : message")
  expect_output(logger.error("message"), "ERROR  \\[.*\\] : message")

  logger.setLevel("WARN")
  expect_equal(logger.getLevel(), "WARN")
  expect_silent(logger.debug("message"))
  expect_silent(logger.info("message"))
  expect_output(logger.warn("message"),  "WARN   \\[.*\\] : message")
  expect_output(logger.error("message"), "ERROR  \\[.*\\] : message")

  logger.setLevel("ERROR")
  expect_equal(logger.getLevel(), "ERROR")
  expect_silent(logger.debug("message"))
  expect_silent(logger.info("message"))
  expect_silent(logger.warn("message"))
  expect_output(logger.error("message"), "ERROR  \\[.*\\] : message")

  logger.setLevel("OFF")
  expect_equal(logger.getLevel(), "OFF")
  expect_silent(logger.debug("message"))
  expect_silent(logger.info("message"))
  expect_silent(logger.warn("message"))
  expect_silent(logger.error("message"))

  logger.setUseConsole(FALSE)
  logger.setLevel("DEBUG")
  expect_silent(logger.debug("message"))
  expect_silent(logger.info("message"))
  expect_silent(logger.warn("message"))
  expect_silent(logger.error("message"))

  logger.setUseConsole(TRUE)
  logger.setLevel("ALL")
  expect_equal(logger.getLevel(), "ALL")
  expect_silent(logger.debug("message"))
  expect_silent(logger.info("message"))
  expect_silent(logger.warn("message"))
  expect_silent(logger.error("message"))
})

test_that("logger message labels match enclosing function", {
  logger.setUseConsole(console = TRUE, stderr = FALSE)

  expect_output(identity(logger.info("message")), "[identity] : message", fixed = TRUE)
  expect_output(identity(PEcAn.logger::logger.info("message")), "[identity] : message", fixed = TRUE)
})
