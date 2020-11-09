/*
 * MATLAB Compiler: 4.13 (R2010a)
 * Date: Fri Jun 30 17:13:55 2017
 * Arguments: "-B" "macro_default" "-o" "perform" "-W" "WinMain:perform" "-T"
 * "link:exe" "-d" "C:\Users\Masoud\Desktop\perform\src" "-w"
 * "enable:specified_file_mismatch" "-w" "enable:repeated_file" "-w"
 * "enable:switch_ignored" "-w" "enable:missing_lib_sentinel" "-w"
 * "enable:demo_license" "-v" "C:\Users\Masoud\Desktop\FERI Software; SHAHROKH
 * RAHBARI;92192570003010\perform.m" 
 */

#include "mclmcrrt.h"

#ifdef __cplusplus
extern "C" {
#endif
const unsigned char __MCC_perform_session_key[] = {
    '2', '5', '1', '8', '4', '3', '4', '5', '9', '6', '9', '9', '3', '6', '3',
    'B', '8', 'B', '7', '5', '0', 'D', '0', '9', 'C', 'D', 'F', '6', '2', '0',
    'B', 'E', '3', '6', '7', '5', '1', '8', '4', '8', '6', 'F', 'E', 'C', '5',
    'F', 'E', 'A', '0', 'C', 'D', 'F', '8', '0', '5', '8', '4', 'C', 'B', '7',
    'A', '3', 'C', 'D', '0', '9', 'A', 'B', 'E', 'F', 'C', '8', '0', 'D', '4',
    'B', '1', 'C', 'C', '6', '4', '6', '6', 'E', '6', '5', '5', '9', 'B', '6',
    'E', '7', 'F', '9', 'F', '9', '5', '1', 'E', 'F', 'E', 'F', 'E', 'C', '2',
    'B', '6', '2', '9', '0', 'F', '7', '3', '3', '7', 'C', 'D', '6', '9', 'F',
    '4', '4', '2', 'C', '4', '3', '7', 'E', 'F', '4', '7', '6', 'D', '9', '7',
    'D', 'F', 'A', 'A', 'E', '0', '8', 'F', '9', '8', '9', 'A', '5', 'E', '4',
    'B', '1', 'D', '0', '3', 'A', '8', '0', '5', '4', '9', '5', 'D', '4', '9',
    'B', '7', '1', 'A', '4', 'B', 'E', '7', 'E', '0', '7', 'D', '1', '3', 'E',
    'F', 'F', 'B', '1', '5', 'B', '9', '3', 'E', '2', '0', '8', 'A', '0', '8',
    'D', 'E', 'B', 'E', '2', '6', 'D', '2', '3', '3', '7', '9', 'E', 'F', '2',
    'E', '1', '1', '9', '6', '6', '9', 'A', '3', 'E', 'A', 'E', '3', '7', 'A',
    '5', '3', '8', 'F', 'A', '5', '4', 'C', 'A', 'A', '5', 'B', '7', 'F', '2',
    '3', 'F', '4', 'D', 'D', '2', '6', '0', 'F', 'E', 'F', 'C', '7', '2', '0',
    '9', '\0'};

const unsigned char __MCC_perform_public_key[] = {
    '3', '0', '8', '1', '9', 'D', '3', '0', '0', 'D', '0', '6', '0', '9', '2',
    'A', '8', '6', '4', '8', '8', '6', 'F', '7', '0', 'D', '0', '1', '0', '1',
    '0', '1', '0', '5', '0', '0', '0', '3', '8', '1', '8', 'B', '0', '0', '3',
    '0', '8', '1', '8', '7', '0', '2', '8', '1', '8', '1', '0', '0', 'C', '4',
    '9', 'C', 'A', 'C', '3', '4', 'E', 'D', '1', '3', 'A', '5', '2', '0', '6',
    '5', '8', 'F', '6', 'F', '8', 'E', '0', '1', '3', '8', 'C', '4', '3', '1',
    '5', 'B', '4', '3', '1', '5', '2', '7', '7', 'E', 'D', '3', 'F', '7', 'D',
    'A', 'E', '5', '3', '0', '9', '9', 'D', 'B', '0', '8', 'E', 'E', '5', '8',
    '9', 'F', '8', '0', '4', 'D', '4', 'B', '9', '8', '1', '3', '2', '6', 'A',
    '5', '2', 'C', 'C', 'E', '4', '3', '8', '2', 'E', '9', 'F', '2', 'B', '4',
    'D', '0', '8', '5', 'E', 'B', '9', '5', '0', 'C', '7', 'A', 'B', '1', '2',
    'E', 'D', 'E', '2', 'D', '4', '1', '2', '9', '7', '8', '2', '0', 'E', '6',
    '3', '7', '7', 'A', '5', 'F', 'E', 'B', '5', '6', '8', '9', 'D', '4', 'E',
    '6', '0', '3', '2', 'F', '6', '0', 'C', '4', '3', '0', '7', '4', 'A', '0',
    '4', 'C', '2', '6', 'A', 'B', '7', '2', 'F', '5', '4', 'B', '5', '1', 'B',
    'B', '4', '6', '0', '5', '7', '8', '7', '8', '5', 'B', '1', '9', '9', '0',
    '1', '4', '3', '1', '4', 'A', '6', '5', 'F', '0', '9', '0', 'B', '6', '1',
    'F', 'C', '2', '0', '1', '6', '9', '4', '5', '3', 'B', '5', '8', 'F', 'C',
    '8', 'B', 'A', '4', '3', 'E', '6', '7', '7', '6', 'E', 'B', '7', 'E', 'C',
    'D', '3', '1', '7', '8', 'B', '5', '6', 'A', 'B', '0', 'F', 'A', '0', '6',
    'D', 'D', '6', '4', '9', '6', '7', 'C', 'B', '1', '4', '9', 'E', '5', '0',
    '2', '0', '1', '1', '1', '\0'};

static const char * MCC_perform_matlabpath_data[] = 
  { "perform/", "$TOOLBOXDEPLOYDIR/",
    "Users/Masoud/Desktop/FERI Software; SHAHROKH RAHBARI;92192570003010/",
    "$TOOLBOXMATLABDIR/general/", "$TOOLBOXMATLABDIR/ops/",
    "$TOOLBOXMATLABDIR/lang/", "$TOOLBOXMATLABDIR/elmat/",
    "$TOOLBOXMATLABDIR/randfun/", "$TOOLBOXMATLABDIR/elfun/",
    "$TOOLBOXMATLABDIR/specfun/", "$TOOLBOXMATLABDIR/matfun/",
    "$TOOLBOXMATLABDIR/datafun/", "$TOOLBOXMATLABDIR/polyfun/",
    "$TOOLBOXMATLABDIR/funfun/", "$TOOLBOXMATLABDIR/sparfun/",
    "$TOOLBOXMATLABDIR/scribe/", "$TOOLBOXMATLABDIR/graph2d/",
    "$TOOLBOXMATLABDIR/graph3d/", "$TOOLBOXMATLABDIR/specgraph/",
    "$TOOLBOXMATLABDIR/graphics/", "$TOOLBOXMATLABDIR/uitools/",
    "$TOOLBOXMATLABDIR/strfun/", "$TOOLBOXMATLABDIR/imagesci/",
    "$TOOLBOXMATLABDIR/iofun/", "$TOOLBOXMATLABDIR/audiovideo/",
    "$TOOLBOXMATLABDIR/timefun/", "$TOOLBOXMATLABDIR/datatypes/",
    "$TOOLBOXMATLABDIR/verctrl/", "$TOOLBOXMATLABDIR/codetools/",
    "$TOOLBOXMATLABDIR/helptools/", "$TOOLBOXMATLABDIR/winfun/",
    "$TOOLBOXMATLABDIR/winfun/NET/", "$TOOLBOXMATLABDIR/demos/",
    "$TOOLBOXMATLABDIR/timeseries/", "$TOOLBOXMATLABDIR/hds/",
    "$TOOLBOXMATLABDIR/guide/", "$TOOLBOXMATLABDIR/plottools/",
    "toolbox/local/", "$TOOLBOXMATLABDIR/datamanager/", "toolbox/compiler/",
    "toolbox/fuzzy/fuzzy/", "toolbox/rf/rf/", "toolbox/rf/rfdemos/" };

static const char * MCC_perform_classpath_data[] = 
  { "" };

static const char * MCC_perform_libpath_data[] = 
  { "" };

static const char * MCC_perform_app_opts_data[] = 
  { "" };

static const char * MCC_perform_run_opts_data[] = 
  { "" };

static const char * MCC_perform_warning_state_data[] = 
  { "off:MATLAB:dispatcher:nameConflict" };


mclComponentData __MCC_perform_component_data = { 

  /* Public key data */
  __MCC_perform_public_key,

  /* Component name */
  "perform",

  /* Component Root */
  "",

  /* Application key data */
  __MCC_perform_session_key,

  /* Component's MATLAB Path */
  MCC_perform_matlabpath_data,

  /* Number of directories in the MATLAB Path */
  43,

  /* Component's Java class path */
  MCC_perform_classpath_data,
  /* Number of directories in the Java class path */
  0,

  /* Component's load library path (for extra shared libraries) */
  MCC_perform_libpath_data,
  /* Number of directories in the load library path */
  0,

  /* MCR instance-specific runtime options */
  MCC_perform_app_opts_data,
  /* Number of MCR instance-specific runtime options */
  0,

  /* MCR global runtime options */
  MCC_perform_run_opts_data,
  /* Number of MCR global runtime options */
  0,
  
  /* Component preferences directory */
  "perform_07C3564FCF5157E2DD89F4D57D3D01BE",

  /* MCR warning status data */
  MCC_perform_warning_state_data,
  /* Number of MCR warning status modifiers */
  1,

  /* Path to component - evaluated at runtime */
  NULL

};

#ifdef __cplusplus
}
#endif


