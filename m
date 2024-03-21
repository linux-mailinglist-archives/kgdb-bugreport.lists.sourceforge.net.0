Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 753D9881B30
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 21 Mar 2024 03:27:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rn89W-00027M-FP
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 21 Mar 2024 02:27:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liu.yeC@h3c.com>) id 1rn89U-00027A-3G
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 21 Mar 2024 02:27:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TYAsZDZr5jfTiZce3j9HNKh22++CXatgn55+7wzibz4=; b=Ix9L2Sth/w2kzi6L3UtxVlyPJg
 dXQ693I0vz4HNwjS4cImIaO6x/2FzbXNCkDNGtN/laYwLssnKw/W1VoBjXcAjZitcXTMs5gN5hufL
 g6ib3wxAWyxQ+pP3kiA6Yzz1sYgd3SjccXn0Ac3eNiq+zWlTsBNgezsyN5VDvSlgJs64=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TYAsZDZr5jfTiZce3j9HNKh22++CXatgn55+7wzibz4=; b=eVVM9wrNt6nlRhTJ43MMKAGOIT
 Y/wBl6ZezwGnAknCvyB1H81A0mqTq8oRCqN4YF7D0/ikUJhnDV6uTGwDun8kECgMpTlTLJwOadcMO
 POACCDuIdxiMuGKn2hBpsp8n6ieApqLhBz7BwL+fe14usbFLQn5ViZ8FeJyQ6Mef28+Y=;
Received: from smtp.h3c.com ([60.191.123.50] helo=h3cspam02-ex.h3c.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rn89P-0005DA-It for kgdb-bugreport@lists.sourceforge.net;
 Thu, 21 Mar 2024 02:27:32 +0000
Received: from mail.maildlp.com ([172.25.15.154])
 by h3cspam02-ex.h3c.com with ESMTP id 42L2QBln090865;
 Thu, 21 Mar 2024 10:26:11 +0800 (GMT-8)
 (envelope-from liu.yeC@h3c.com)
Received: from DAG6EX02-IMDC.srv.huawei-3com.com (unknown [10.62.14.11])
 by mail.maildlp.com (Postfix) with ESMTP id 201322006135;
 Thu, 21 Mar 2024 10:27:51 +0800 (CST)
Received: from localhost.localdomain (10.114.186.34) by
 DAG6EX02-IMDC.srv.huawei-3com.com (10.62.14.11) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.27; Thu, 21 Mar 2024 10:26:10 +0800
From: <liu.yec@h3c.com>
To: <daniel.thompson@linaro.org>
Date: Thu, 21 Mar 2024 10:26:04 +0800
Message-ID: <20240321022604.4088438-1-liu.yec@h3c.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240320162802.GA22198@aspen.lan>
References: <20240320162802.GA22198@aspen.lan>
MIME-Version: 1.0
X-Originating-IP: [10.114.186.34]
X-ClientProxiedBy: BJSMTP01-EX.srv.huawei-3com.com (10.63.20.132) To
 DAG6EX02-IMDC.srv.huawei-3com.com (10.62.14.11)
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: h3cspam02-ex.h3c.com 42L2QBln090865
X-Spam-Score: 2.5 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: LiuYe <liu.yeC@h3c.com> Currently,
 if CONFIG_KDB_KEYBOARD
 is enabled, then kgdboc will attempt to use schedule_work() to provoke a
 keyboard reset when transitioning out of the debugger and back to normal
 operation. This can [...] 
 Content analysis details:   (2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rn89P-0005DA-It
Subject: [Kgdb-bugreport] [PATCH V3] kdb: Fix the deadlock issue in KDB
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
Cc: kgdb-bugreport@lists.sourceforge.net, jason.wessel@windriver.com,
 linux-kernel@vger.kernel.org, LiuYe <liu.yeC@h3c.com>,
 linux-serial@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org
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

example:
 BUG: spinlock lockup suspected on CPU#0, namex/10450
 lock: 0xffff881ffe823980, .magic: dead4ead, .owner: namexx/21888, .owner_cpu: 1
 ffff881741d00000 ffff881741c01000 0000000000000000 0000000000000000
 ffff881740f58e78 ffff881741cffdd0 ffffffff8147a7fc ffff881740f58f20
Call Trace:
 [<ffffffff81479e6d>] ? __schedule+0x16d/0xac0
 [<ffffffff8147a7fc>] ? schedule+0x3c/0x90
 [<ffffffff8147e71a>] ? schedule_hrtimeout_range_clock+0x10a/0x120
 [<ffffffff8147d22e>] ? mutex_unlock+0xe/0x10
 [<ffffffff811c839b>] ? ep_scan_ready_list+0x1db/0x1e0
 [<ffffffff8147e743>] ? schedule_hrtimeout_range+0x13/0x20
 [<ffffffff811c864a>] ? ep_poll+0x27a/0x3b0
 [<ffffffff8108c540>] ? wake_up_q+0x70/0x70
 [<ffffffff811c99a8>] ? SyS_epoll_wait+0xb8/0xd0
 [<ffffffff8147f296>] ? entry_SYSCALL_64_fastpath+0x12/0x75
 CPU: 0 PID: 10450 Comm: namex Tainted: G           O    4.4.65 #1
 Hardware name: Insyde Purley/Type2 - Board Product Name1, BIOS 05.21.51.0036 07/19/2019
  0000000000000000 ffff881ffe813c10 ffffffff8124e883 ffff881741c01000
  ffff881ffe823980 ffff881ffe813c38 ffffffff810a7f7f ffff881ffe823980
  000000007d2b7cd0 0000000000000001 ffff881ffe813c68 ffffffff810a80e0
  Call Trace:
  <#DB>  [<ffffffff8124e883>] dump_stack+0x85/0xc2
  [<ffffffff810a7f7f>] spin_dump+0x7f/0x100
  [<ffffffff810a80e0>] do_raw_spin_lock+0xa0/0x150
  [<ffffffff8147eb55>] _raw_spin_lock+0x15/0x20
  [<ffffffff8108c256>] try_to_wake_up+0x176/0x3d0
  [<ffffffff8108c4c5>] wake_up_process+0x15/0x20
  [<ffffffff8107b371>] insert_work+0x81/0xc0
  [<ffffffff8107b4e5>] __queue_work+0x135/0x390
  [<ffffffff8107b786>] queue_work_on+0x46/0x90
  [<ffffffff81313d28>] kgdboc_post_exp_handler+0x48/0x70
  [<ffffffff810ed488>] kgdb_cpu_enter+0x598/0x610
  [<ffffffff810ed6e2>] kgdb_handle_exception+0xf2/0x1f0
  [<ffffffff81054e21>] __kgdb_notify+0x71/0xd0
  [<ffffffff81054eb5>] kgdb_notify+0x35/0x70
  [<ffffffff81082e6a>] notifier_call_chain+0x4a/0x70
  [<ffffffff8108304d>] notify_die+0x3d/0x50
  [<ffffffff81017219>] do_int3+0x89/0x120
  [<ffffffff81480fb4>] int3+0x44/0x80

Signed-off-by: LiuYe <liu.yeC@h3c.com>
Co-authored-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/tty/serial/kgdboc.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index 7ce7bb164..161b25ecc 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -22,6 +22,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/serial_core.h>
+#include <linux/irq_work.h>
 
 #define MAX_CONFIG_LEN		40
 
@@ -99,10 +100,17 @@ static void kgdboc_restore_input_helper(struct work_struct *dummy)
 
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
@@ -133,6 +141,7 @@ static void kgdboc_unregister_kbd(void)
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
