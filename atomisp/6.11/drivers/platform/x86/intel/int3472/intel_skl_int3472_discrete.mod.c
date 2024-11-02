#include <linux/module.h>
#define INCLUDE_VERMAGIC
#include <linux/build-salt.h>
#include <linux/elfnote-lto.h>
#include <linux/export-internal.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

#ifdef CONFIG_UNWINDER_ORC
#include <asm/orc_header.h>
ORC_HEADER;
#endif

BUILD_SALT;
BUILD_LTO_INFO;

MODULE_INFO(vermagic, VERMAGIC_STRING);
MODULE_INFO(name, KBUILD_MODNAME);

__visible struct module __this_module
__section(".gnu.linkonce.this_module") = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};

MODULE_INFO(intree, "Y");

#ifdef CONFIG_MITIGATION_RETPOLINE
MODULE_INFO(retpoline, "Y");
#endif



static const struct modversion_info ____versions[]
__used __section("__versions") = {
	{ 0xcf8e8a50, "regulator_register" },
	{ 0xc3abdb9, "led_classdev_unregister" },
	{ 0xd567ff69, "__dynamic_dev_dbg" },
	{ 0xbdfb6dbb, "__fentry__" },
	{ 0x58a20c5, "acpi_dev_get_resources" },
	{ 0xf0fdf6cb, "__stack_chk_fail" },
	{ 0x8d133dec, "put_device" },
	{ 0x5322663e, "acpi_get_handle" },
	{ 0xae5a04bb, "acpi_evaluate_dsm" },
	{ 0x973fbee4, "led_add_lookup" },
	{ 0x6fec1727, "_dev_err" },
	{ 0xd0c44cc2, "led_classdev_register_ext" },
	{ 0xd8df08ac, "acpi_handle_printk" },
	{ 0xa917574f, "_dev_warn" },
	{ 0x1c0b482e, "acpi_dev_clear_dependencies" },
	{ 0x5b8239ca, "__x86_return_thunk" },
	{ 0xfb384d37, "kasprintf" },
	{ 0x3d2a2414, "__platform_driver_register" },
	{ 0xa151825a, "devm_kasprintf" },
	{ 0x38aa1397, "gpiod_add_lookup_table" },
	{ 0x6abf8414, "acpi_fetch_acpi_dev" },
	{ 0xf63f003a, "acpi_gpio_get_io_resource" },
	{ 0xd92deb6b, "acpi_evaluate_object" },
	{ 0x5e22eb89, "devm_gpiod_get" },
	{ 0xdc1b3861, "__kmalloc_cache_noprof" },
	{ 0xff81487d, "gpiod_remove_lookup_table" },
	{ 0x64bcfec9, "clk_register" },
	{ 0x173f97c8, "dev_err_probe" },
	{ 0xdd18a993, "acpi_check_dsm" },
	{ 0x349cba85, "strchr" },
	{ 0x46fec78, "acpi_dev_get_next_consumer_dev" },
	{ 0x50877b9, "dmi_first_match" },
	{ 0xd84e5435, "kmalloc_caches" },
	{ 0xdc6699cb, "acpi_dev_free_resource_list" },
	{ 0x19b4c796, "is_acpi_device_node" },
	{ 0x94a32c73, "devm_kmalloc" },
	{ 0xb1dfe313, "platform_driver_unregister" },
	{ 0x656e4a6e, "snprintf" },
	{ 0xedc9f7c, "clkdev_create" },
	{ 0x6a2eb909, "regulator_unregister" },
	{ 0x6f5b4cf6, "clkdev_drop" },
	{ 0x7757b51a, "clk_unregister" },
	{ 0xda6ce3a, "gpiod_set_value_cansleep" },
	{ 0x37a0cba, "kfree" },
	{ 0x93335116, "led_remove_lookup" },
	{ 0xd9609d52, "module_layout" },
};

MODULE_INFO(depends, "");

MODULE_ALIAS("acpi*:INT3472:*");
