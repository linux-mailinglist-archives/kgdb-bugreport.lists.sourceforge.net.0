Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3632117DE
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  2 Jul 2020 03:27:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jqo0w-00034m-Rf
	for lists+kgdb-bugreport@lfdr.de; Thu, 02 Jul 2020 01:27:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1jqo0v-00034S-B6
 for kgdb-bugreport@lists.sourceforge.net; Thu, 02 Jul 2020 01:27:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y3pwKQ2lDOwxzU8+rDjKeTInGn8inJIhX+PtgwL3TtQ=; b=dNKly3BVaDoHVsqme63UerxGgm
 RXWPfUhGSmMcabBRPlCnk3chlkC2PT+DNVuEKI/yWNKzlRVqRlkonOcGAwDPJ64VaG2AnOUH3ZfHR
 r1AsnlxQsigSF8jYNsiZua1vHvTQy8PCVOG8Lm+9qXDnHHNouepGPPyiMVyahz2FHxZE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y3pwKQ2lDOwxzU8+rDjKeTInGn8inJIhX+PtgwL3TtQ=; b=kSmWl6SAdaUgpnQjgMAdfLF5cH
 ueYjwR61ri2XGJ+dJBcxZRgLWxBWV4Sv7jiP0RD+Gwvxt3Tg8mafaSo3tVytvLPE5NePTdD3wmRb1
 AnHKyRfbrxmd2KDxdZBsdzPUAAo5CUWMTjqVyUqp0Y/DjuQUavXwFFZH6Z/EaMFS8BkY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jqo0t-007TrB-V0
 for kgdb-bugreport@lists.sourceforge.net; Thu, 02 Jul 2020 01:27:45 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DDED92083E;
 Thu,  2 Jul 2020 01:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593653258;
 bh=BKDfyG9iI5w/CsTBdkXPgua6e2lQjWnLmHqiGKG3ANg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P2a+npteE8c247FxGSE+XnL8KehQQQGqzMfZ1m9F/9N9DiZ0cRkMEczQla2OG3vJX
 NakD1XnekCZDlYSgCy7ZnSVd8bMEcnsqvbnoG7gIPwBjAE9t8spz1T2jqK0b6UPz3Q
 6T+yNEHQUkj0BeDlwZY9BU+KPdvJCMNaXphu0DQ4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed,  1 Jul 2020 21:27:29 -0400
Message-Id: <20200702012729.2702141-7-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702012729.2702141-1-sashal@kernel.org>
References: <20200702012729.2702141-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jqo0t-007TrB-V0
Subject: [Kgdb-bugreport] [PATCH AUTOSEL 4.4 7/7] kgdb: Avoid suspicious RCU
 usage warning
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
Cc: Sasha Levin <sashal@kernel.org>, kgdb-bugreport@lists.sourceforge.net,
 Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: Douglas Anderson <dianders@chromium.org>

[ Upstream commit 440ab9e10e2e6e5fd677473ee6f9e3af0f6904d6 ]

At times when I'm using kgdb I see a splat on my console about
suspicious RCU usage.  I managed to come up with a case that could
reproduce this that looked like this:

  WARNING: suspicious RCU usage
  5.7.0-rc4+ #609 Not tainted
  -----------------------------
  kernel/pid.c:395 find_task_by_pid_ns() needs rcu_read_lock() protection!

  other info that might help us debug this:

    rcu_scheduler_active = 2, debug_locks = 1
  3 locks held by swapper/0/1:
   #0: ffffff81b6b8e988 (&dev->mutex){....}-{3:3}, at: __device_attach+0x40/0x13c
   #1: ffffffd01109e9e8 (dbg_master_lock){....}-{2:2}, at: kgdb_cpu_enter+0x20c/0x7ac
   #2: ffffffd01109ea90 (dbg_slave_lock){....}-{2:2}, at: kgdb_cpu_enter+0x3ec/0x7ac

  stack backtrace:
  CPU: 7 PID: 1 Comm: swapper/0 Not tainted 5.7.0-rc4+ #609
  Hardware name: Google Cheza (rev3+) (DT)
  Call trace:
   dump_backtrace+0x0/0x1b8
   show_stack+0x1c/0x24
   dump_stack+0xd4/0x134
   lockdep_rcu_suspicious+0xf0/0x100
   find_task_by_pid_ns+0x5c/0x80
   getthread+0x8c/0xb0
   gdb_serial_stub+0x9d4/0xd04
   kgdb_cpu_enter+0x284/0x7ac
   kgdb_handle_exception+0x174/0x20c
   kgdb_brk_fn+0x24/0x30
   call_break_hook+0x6c/0x7c
   brk_handler+0x20/0x5c
   do_debug_exception+0x1c8/0x22c
   el1_sync_handler+0x3c/0xe4
   el1_sync+0x7c/0x100
   rpmh_rsc_probe+0x38/0x420
   platform_drv_probe+0x94/0xb4
   really_probe+0x134/0x300
   driver_probe_device+0x68/0x100
   __device_attach_driver+0x90/0xa8
   bus_for_each_drv+0x84/0xcc
   __device_attach+0xb4/0x13c
   device_initial_probe+0x18/0x20
   bus_probe_device+0x38/0x98
   device_add+0x38c/0x420

If I understand properly we should just be able to blanket kgdb under
one big RCU read lock and the problem should go away.  We'll add it to
the beast-of-a-function known as kgdb_cpu_enter().

With this I no longer get any splats and things seem to work fine.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Link: https://lore.kernel.org/r/20200602154729.v2.1.I70e0d4fd46d5ed2aaf0c98a355e8e1b7a5bb7e4e@changeid
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 kernel/debug/debug_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 9c939c6bf21cb..321ccdbb73649 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -488,6 +488,7 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
 		arch_kgdb_ops.disable_hw_break(regs);
 
 acquirelock:
+	rcu_read_lock();
 	/*
 	 * Interrupts will be restored by the 'trap return' code, except when
 	 * single stepping.
@@ -542,6 +543,7 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
 			atomic_dec(&slaves_in_kgdb);
 			dbg_touch_watchdogs();
 			local_irq_restore(flags);
+			rcu_read_unlock();
 			return 0;
 		}
 		cpu_relax();
@@ -560,6 +562,7 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
 		raw_spin_unlock(&dbg_master_lock);
 		dbg_touch_watchdogs();
 		local_irq_restore(flags);
+		rcu_read_unlock();
 
 		goto acquirelock;
 	}
@@ -677,6 +680,7 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
 	raw_spin_unlock(&dbg_master_lock);
 	dbg_touch_watchdogs();
 	local_irq_restore(flags);
+	rcu_read_unlock();
 
 	return kgdb_info[cpu].ret_state;
 }
-- 
2.25.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
