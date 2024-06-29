/*
 * hello-1.c
 */
#include <linux/module.h>	/* 모든 모듈에 필요 */
#include <linux/printk.h>	/* pr_info()에 필요 */

int init_module(void)
{
	pr_info("Hello world 1.\n");

	/* 0: 성공
	 * 그 외 : 실패
	 */
	return 0;
}

void cleanup_module(void)
{
	pr_info("Goodbye world 1.\n");
}

MODULE_LICENSE("GPL");
