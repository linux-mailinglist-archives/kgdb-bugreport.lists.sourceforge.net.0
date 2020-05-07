Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B09AB1C9ECC
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  8 May 2020 00:54:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jWpPX-0006uE-Ga
	for lists+kgdb-bugreport@lfdr.de; Thu, 07 May 2020 22:54:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jWpPW-0006u7-4T
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 22:54:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X1eOoZGo2RhELWP8ZXLrEQsjy79crnPXYewegVbC2bc=; b=AWv+pc+eSS9FCcUpNDVpSJQSy0
 Wyo7KMnPgGQXQDr8bbbbi0no5PZLODHxstUYgeLmLF9b/6dHNETWAoT4IO5D+biafG0/V5t8I62SH
 IQregQvMYotKaLZxZms/Mb26IpF5DQxoI54RVwdZrkhzvhVnZI6qVlw57eyJReHqVxgU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=X1eOoZGo2RhELWP8ZXLrEQsjy79crnPXYewegVbC2bc=; b=c
 tpdBt5xI2TdK1Uaj9nisv9zHLZiqR4MAjzY7Y1PRgyLlCxfTkkfJZYumRQNHlsN8YH4ZuZPDcUCWH
 PMB1Pl2bwlvnCCDLnCJZwnWmq/pFmJkAu8kgq0ULJE6gkn/E071MMS6XAtHXWljBVEztNwG8RB+X3
 fDEhZbxbRIG3Uglk=;
Received: from mail-pl1-f193.google.com ([209.85.214.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jWpPU-00Blgm-6Q
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 22:54:34 +0000
Received: by mail-pl1-f193.google.com with SMTP id s20so2688519plp.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 07 May 2020 15:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X1eOoZGo2RhELWP8ZXLrEQsjy79crnPXYewegVbC2bc=;
 b=WAPAb6AJ5skxQqiGjsj4YLprJto6hJMDsC1OXq2025SYCXQw680iFz8cZQDTQ1DckJ
 EmxNFgDSkka2NqoQTFhhqT/tuSIZd2brTu/CJYiVc8+eMuFmzWsQT+pvUbKme/7dYNq5
 oV1FD3X4i27cGhlx9grXyhUdkRWJpiSoqqf6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X1eOoZGo2RhELWP8ZXLrEQsjy79crnPXYewegVbC2bc=;
 b=l02jMdrvy2jR4OBLNLUFreY+jzHhAjoJtaePIYgYJP0vdr3qjIvkK27CoFaJkhAxhR
 /fN6hfSbphogYF/VRCaSrBfSqKbXbvBQEZK1QLVo2wHlzXsPv6WZ8ak0jAu+URApacxn
 8VSoepl7TBMl5KHO7TJ3FJgoBufMClnlOayHa2Q6Z1Nts6PIOpPf8OYJWUo4xaBm1qcC
 zbAVvODawAnBhXsJFA01pzS0VO6E65dPXjp5Rm3zcHJ7V7pQbc7Gl0je2woOofQfcSO8
 xH759YhzNyPvk1cqDw1VxgBCH10d2N75xwwn8op2SrBAkHVwPvl2HRVpbYJ1G/GZ/Una
 PFIQ==
X-Gm-Message-State: AGi0PuZg0HkX9bDaK8YLPjIi0u4P6i152MidMRDr/mLf8xYmWJfVI1Sl
 7feNLcpvNByIqluHRydImO35iA==
X-Google-Smtp-Source: APiQypJKFKpsytswpG/Q3vS6VvEccA4XHAZJIeSSZXlao5nBRjVP6Zd0WcIrMxJfYOyASvW1D28v3w==
X-Received: by 2002:a17:90a:ba88:: with SMTP id
 t8mr2525688pjr.182.1588892059212; 
 Thu, 07 May 2020 15:54:19 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id k6sm763768pju.44.2020.05.07.15.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 15:54:18 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>
Date: Thu,  7 May 2020 15:53:58 -0700
Message-Id: <20200507153444.1.I70e0d4fd46d5ed2aaf0c98a355e8e1b7a5bb7e4e@changeid>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.193 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWpPU-00Blgm-6Q
Subject: [Kgdb-bugreport] [PATCH] kgdb: Avoid suspicious RCU usage warning
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
Cc: linux-kernel@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

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
---

 kernel/debug/debug_core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 2b7c9b67931d..5155cf06731b 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -564,6 +564,8 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
 	int online_cpus = num_online_cpus();
 	u64 time_left;
 
+	rcu_read_lock();
+
 	kgdb_info[ks->cpu].enter_kgdb++;
 	kgdb_info[ks->cpu].exception_state |= exception_state;
 
@@ -635,6 +637,7 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
 			atomic_dec(&slaves_in_kgdb);
 			dbg_touch_watchdogs();
 			local_irq_restore(flags);
+			rcu_read_unlock();
 			return 0;
 		}
 		cpu_relax();
@@ -773,6 +776,8 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
 	dbg_touch_watchdogs();
 	local_irq_restore(flags);
 
+	rcu_read_unlock();
+
 	return kgdb_info[cpu].ret_state;
 }
 
-- 
2.26.2.645.ge9eca65c58-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
