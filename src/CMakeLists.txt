add_library(libtdb process.cpp pipe.cpp libtdb.cpp)
add_library(tdb::libtdb ALIAS libtdb)

set_target_properties(
    libtdb
    PROPERTIES OUTPUT_NAME tdb
)

target_compile_features(libtdb PUBLIC cxx_std_17)

target_include_directories(libtdb
    PUBLIC
      $<INSTALL_INTERFACE:include>
      $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/include>
    PRIVATE
        ${CMAKE_SOURCE_DIR}/src/include
)

include(GNUInstallDirs)
install(TARGETS libtdb
    EXPORT tdb-targets
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)

install(
    DIRECTORY ${PROJECT_SOURCE_DIR}/include/
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)

install(
    EXPORT tdb-targets
    FILE tdb-config.cmake
    NAMESPACE tdb::
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/tdb
)
