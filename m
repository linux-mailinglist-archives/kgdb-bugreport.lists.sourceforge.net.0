Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD68689EBB4
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 10 Apr 2024 09:19:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ruSFJ-0000xJ-PC
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 10 Apr 2024 07:19:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liu.yeC@h3c.com>) id 1ruSFI-0000x1-6o
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 10 Apr 2024 07:19:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bRqiB516V6Kdxnum90EuhH/xin0+FLW+xbldwH06ooo=; b=HH776XuqRgY3scw0xtOmyyz1Lp
 I9Q70MuAwDxu//9YJCkQWp7dqTOSYYU6eLlhD/q5GRZzR9954v67Eu3F50O/i6Z+sDjkQNbFR4T2b
 6Ld8TKAIz3VUeDYA5w/Y1RFjbdo2Jf6A0AMTPYCMPVu5zgxlHVLz3M79Q1nG3kNLKMYU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bRqiB516V6Kdxnum90EuhH/xin0+FLW+xbldwH06ooo=; b=bTKtdlltDFX/K9JPBHUZ+5/ZWy
 PgRDqRjdOADaSDqRAb7NYrifSKOP7eEhhUCsEVMtPMaZkhpwEte24aYodymJ6v2AYhkuwEhORqKRP
 Qx1uJW4zVa6arAHQEC8laB3b4CU0N8bPyD68BL/UH64OcyKU3KZzkK9DEteWbD1J2ytA=;
Received: from smtp.h3c.com ([60.191.123.50] helo=h3cspam02-ex.h3c.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ruSFG-0006b0-Mw for kgdb-bugreport@lists.sourceforge.net;
 Wed, 10 Apr 2024 07:19:48 +0000
Received: from mail.maildlp.com ([172.25.15.154])
 by h3cspam02-ex.h3c.com with ESMTP id 43A7Iduf024986;
 Wed, 10 Apr 2024 15:18:39 +0800 (GMT-8)
 (envelope-from liu.yeC@h3c.com)
Received: from DAG6EX02-IMDC.srv.huawei-3com.com (unknown [10.62.14.11])
 by mail.maildlp.com (Postfix) with ESMTP id 9266A2004BB5;
 Wed, 10 Apr 2024 15:20:49 +0800 (CST)
Received: from localhost.localdomain (10.114.186.34) by
 DAG6EX02-IMDC.srv.huawei-3com.com (10.62.14.11) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.27; Wed, 10 Apr 2024 15:18:29 +0800
From: <liu.yec@h3c.com>
To: <andy.shevchenko@gmail.com>, <daniel.thompson@linaro.org>,
 <gregkh@linuxfoundation.org>
Date: Wed, 10 Apr 2024 15:18:10 +0800
Message-ID: <20240410071810.3432842-1-liu.yec@h3c.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <567857bab013409ca53fa7c36292f4b0@h3c.com>
References: <567857bab013409ca53fa7c36292f4b0@h3c.com>
MIME-Version: 1.0
X-Originating-IP: [10.114.186.34]
X-ClientProxiedBy: BJSMTP02-EX.srv.huawei-3com.com (10.63.20.133) To
 DAG6EX02-IMDC.srv.huawei-3com.com (10.62.14.11)
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: h3cspam02-ex.h3c.com 43A7Iduf024986
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: LiuYe <liu.yeC@h3c.com> Currently,
 if CONFIG_KDB_KEYBOARD
 is enabled, then kgdboc will attempt to use schedule_work() to provoke a
 keyboard reset when transitioning out of the debugger and back to normal
 operation. This can [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [60.191.123.50 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1ruSFG-0006b0-Mw
Subject: [Kgdb-bugreport] [PATCH V11] kdb: Fix the deadlock issue in KDB
 debugging.
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 liu.yeC@h3c.com, linux-serial@vger.kernel.org, jason.wessel@windriver.com,
 jirislaby@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: LiuYe <liu.yeC@h3c.com>

Currently, if CONFIG_KDB_KEYBOARD is enabled, then kgdboc will
attempt to use schedule_work() to provoke a keyboard reset when
transitioning out of the debugger and back to normal operation.
This can cause deadlock because schedule_work() is not NMI-safe.

The stack trace below shows an example of the problem. In this
case the master cpu is not running from NMI but it has parked
the slave CPUs using an NMI and the parked CPUs is holding
spinlocks needed by schedule_work().

Example:
BUG: spinlock lockup suspected on CPU#0. owner_cpu: 1
CPU1: Call Trace:
__schedule
schedule
schedule_hrtimeout_range_clock
mutex_unlock
ep_scan_ready_list
schedule_hrtimeout_range
ep_poll
wake_up_q
SyS_epoll_wait
entry_SYSCALL_64_fastpath

CPU0: Call Trace:
dump_stack
spin_dump
do_raw_spin_lock
_raw_spin_lock
try_to_wake_up
wake_up_process
insert_work
__queue_work
queue_work_on
kgdboc_post_exp_handler
kgdb_cpu_enter
kgdb_handle_exception
__kgdb_notify
kgdb_notify
notifier_call_chain
notify_die
do_int3
int3

We fix the problem by using irq_work to call schedule_work()
instead of calling it directly. This is because we cannot
resynchronize the keyboard state from the hardirq context
provided by irq_work. This must be done from the task context
in order to call the input subsystem.

Therefore, we have to defer the work twice. First, safely
switch from the debug trap context (similar to NMI) to the
hardirq, and then switch from the hardirq to the system work queue.

Signed-off-by: LiuYe <liu.yeC@h3c.com>
Co-developed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>

---
V10 -> V11: Revert to V9
V9 -> V10 : Add Signed-off-by of Greg KH and Andy Shevchenko, Acked-by of Daniel Thompson
V8 -> V9: Modify call trace format and move irq_work.h before module.h
V7 -> V8: Update the description information and comments in the code.
	: Submit this patch based on version linux-6.9-rc2.
V6 -> V7: Add comments in the code.
V5 -> V6: Replace with a more professional and accurate answer.
V4 -> V5: Answer why schedule another work in the irq_work and not do the job directly.
V3 -> V4: Add changelogs
V2 -> V3: Add description information
V1 -> V2: using irq_work to solve this properly.
---
---
 drivers/tty/serial/kgdboc.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index 7ce7bb164..32410fec7 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -19,6 +19,7 @@
 #include <linux/console.h>
 #include <linux/vt_kern.h>
 #include <linux/input.h>
+#include <linux/irq_work.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/serial_core.h>
@@ -82,6 +83,19 @@ static struct input_handler kgdboc_reset_handler = {
 
 static DEFINE_MUTEX(kgdboc_reset_mutex);
 
+/*
+ * This code ensures that the keyboard state, which is changed during kdb
+ * execution, is resynchronized when we leave the debug trap. The resync
+ * logic calls into the input subsystem to force a reset. The calls into
+ * the input subsystem must be executed from normal task context.
+ *
+ * We need to trigger the resync from the debug trap, which executes in an
+ * NMI (or similar) context. To make it safe to call into the input
+ * subsystem we end up having use two deferred execution techniques.
+ * Firstly, we use irq_work, which is NMI-safe, to provoke a callback from
+ * hardirq context. Then, from the hardirq callback we use the system
+ * workqueue to provoke the callback that actually performs the resync.
+ */
 static void kgdboc_restore_input_helper(struct work_struct *dummy)
 {
 	/*
@@ -99,10 +113,17 @@ static void kgdboc_restore_input_helper(struct work_struct *dummy)
 
 static DECLARE_WORK(kgdboc_restore_input_work, kgdboc_restore_input_helper);
 
+static void kgdboc_queue_restore_input_helper(struct irq_work *unused)
+{
+	schedule_work(&kgdboc_restore_input_work);
+}
+
+static DEFINE_IRQ_WORK(kgdboc_restore_input_irq_work, kgdboc_queue_restore_input_helper);
+
 static void kgdboc_restore_input(void)
 {
 	if (likely(system_state == SYSTEM_RUNNING))
-		schedule_work(&kgdboc_restore_input_work);
+		irq_work_queue(&kgdboc_restore_input_irq_work);
 }
 
 static int kgdboc_register_kbd(char **cptr)
@@ -133,6 +154,7 @@ static void kgdboc_unregister_kbd(void)
 			i--;
 		}
 	}
+	irq_work_sync(&kgdboc_restore_input_irq_work);
 	flush_work(&kgdboc_restore_input_work);
 }
 #else /* ! CONFIG_KDB_KEYBOARD */
-- 
2.25.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
