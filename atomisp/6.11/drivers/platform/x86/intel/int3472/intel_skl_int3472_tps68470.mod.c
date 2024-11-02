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
	{ 0x37a0cba, "kfree" },
	{ 0xbdfb6dbb, "__fentry__" },
	{ 0xf129be3d, "__devm_regmap_init_i2c" },
	{ 0xf0fdf6cb, "__stack_chk_fail" },
	{ 0x8d133dec, "put_device" },
	{ 0x5c51d06, "_dev_info" },
	{ 0xac2c1e4f, "i2c_register_driver" },
	{ 0x6fec1727, "_dev_err" },
	{ 0xd8df08ac, "acpi_handle_printk" },
	{ 0x5b8239ca, "__x86_return_thunk" },
	{ 0xe2d5255a, "strcmp" },
	{ 0xa151825a, "devm_kasprintf" },
	{ 0x38aa1397, "gpiod_add_lookup_table" },
	{ 0x3094a81f, "regmap_read" },
	{ 0xd92deb6b, "acpi_evaluate_object" },
	{ 0xdc1b3861, "__kmalloc_cache_noprof" },
	{ 0xff81487d, "gpiod_remove_lookup_table" },
	{ 0x173f97c8, "dev_err_probe" },
	{ 0x276da1c4, "i2c_del_driver" },
	{ 0x46fec78, "acpi_dev_get_next_consumer_dev" },
	{ 0x335c1733, "devm_mfd_add_devices" },
	{ 0x50877b9, "dmi_first_match" },
	{ 0xd84e5435, "kmalloc_caches" },
	{ 0x19b4c796, "is_acpi_device_node" },
	{ 0xd287fc06, "regmap_write" },
	{ 0x94a32c73, "devm_kmalloc" },
	{ 0xd9609d52, "module_layout" },
};

MODULE_INFO(depends, "");

MODULE_ALIAS("acpi*:INT3472:*");
