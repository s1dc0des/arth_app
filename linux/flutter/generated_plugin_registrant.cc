//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <agent_dart/agent_dart_plugin.h>
#include <flutter_secure_storage_linux/flutter_secure_storage_linux_plugin.h>
#include <nb_utils/nb_utils_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) agent_dart_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "AgentDartPlugin");
  agent_dart_plugin_register_with_registrar(agent_dart_registrar);
  g_autoptr(FlPluginRegistrar) flutter_secure_storage_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FlutterSecureStorageLinuxPlugin");
  flutter_secure_storage_linux_plugin_register_with_registrar(flutter_secure_storage_linux_registrar);
  g_autoptr(FlPluginRegistrar) nb_utils_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "nb_utils_plugin");
  nb_utils_plugin_register_with_registrar(nb_utils_registrar);
}