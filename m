Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD33C1EC540
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  3 Jun 2020 00:48:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jgFhV-0001Di-L7
	for lists+kgdb-bugreport@lfdr.de; Tue, 02 Jun 2020 22:48:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jgFhU-0001DD-BU
 for kgdb-bugreport@lists.sourceforge.net; Tue, 02 Jun 2020 22:48:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x1KXljua1G5hAoel7DwUEO0U9O2u7J2/xCv2Bo1SECA=; b=YCutAAF4GwpHjF8qzc/CpCrENx
 mTVgYQTVNcQ3+boV7wzTBb0pxWF5pOaFqsXV+am0LAd5JKKESfUhNFl9yjddRKExqxe5/D57vuG52
 g7Uume75dJoS9z75pwfKp+lh1yKHKdRJWL3ce4WNDJEk0H1NgN6VyRwvhL5OWK+v142E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=x1KXljua1G5hAoel7DwUEO0U9O2u7J2/xCv2Bo1SECA=; b=E
 AhMCfnKwCRs2ebCwYjSnYQM5e+cre1fwGQQFopkF7x7gZ3P5/gYo7Lp0kQl0k+P7tKsOZzEDVO+li
 k0TJH88I1iNBMGj5X07tWd5H1hzws2+DQJm6L165T9Ul+VKg8EnPSZMfdJPDwYyi3AHYRoCposskq
 AlpRyXjEW2TN5QPE=;
Received: from mail-pg1-f196.google.com ([209.85.215.196])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jgFhS-009thH-V8
 for kgdb-bugreport@lists.sourceforge.net; Tue, 02 Jun 2020 22:48:04 +0000
Received: by mail-pg1-f196.google.com with SMTP id u5so313504pgn.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 02 Jun 2020 15:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x1KXljua1G5hAoel7DwUEO0U9O2u7J2/xCv2Bo1SECA=;
 b=iWF16kqpdpIGtjp4xjBjKqaVpGDpxlLCroVAwhliDtYhWFf8MY/3vyqEG5n6Il9+Fo
 DerUOVLmdU+EKOQVPAeoRrJ1q1Pl0K+eS/qIqC/KUhRbmQXRl9nk4Ug9huZC/rpqTPr2
 9ZCZ+7Go9nue5fKbjPKA8SLvQO9EfzUOER4NY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x1KXljua1G5hAoel7DwUEO0U9O2u7J2/xCv2Bo1SECA=;
 b=oQuJ8UpgBo7wqstw+u0lq3bypEAxcKr9zCbOd/tahemxgwaRNdO1sJlhgn6BPNCmQp
 StEzqpbC8FSGls0obwtGI4xDY2JqtqVTmrz8chodqy0V7n4dfmvqu8075kjqnvJPut77
 EQktFlhaPg1P0VV05YOzWnPiydYTwrdtC9UU5gSNfKYi2cvCArbJjyKFTPplEVsAtEFd
 VyyqmbU6XqRy068e77YJbna/z3UHqtEQeZh3nggGAd2nP8wvyIm47FQqpwcDCE9HniUW
 XlyALRMoeAhRXZf0GD5f8CXqB1jzCHdg42PeM53jzqngrqR9ghDnH7QG9uilymav/S9w
 miVg==
X-Gm-Message-State: AOAM532r35nT7W3fWZNcDhoLQGF+K2+Lt2vFtiJsjh94HKtkHjUvYg6i
 bjcpe0pfnAmhdSP//Y+Sh7pbeQ==
X-Google-Smtp-Source: ABdhPJyunawwPk6QVYIip344J3GUrogqxyNoIrIxPW+q87l4LTgEH9YrcHGEx+smIuSrHsQ69HWQ6g==
X-Received: by 2002:a17:90a:ce05:: with SMTP id
 f5mr1707468pju.32.1591138077291; 
 Tue, 02 Jun 2020 15:47:57 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id j10sm88789pjf.9.2020.06.02.15.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 15:47:56 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>
Date: Tue,  2 Jun 2020 15:47:39 -0700
Message-Id: <20200602154729.v2.1.I70e0d4fd46d5ed2aaf0c98a355e8e1b7a5bb7e4e@changeid>
X-Mailer: git-send-email 2.27.0.rc2.251.g90737beb825-goog
MIME-Version: 1.0
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.196 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.196 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 1.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jgFhS-009thH-V8
Subject: [Kgdb-bugreport] [PATCH v2] kgdb: Avoid suspicious RCU usage warning
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

Changes in v2:
- Cuddle up to the local interrupt locking code.

 kernel/debug/debug_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index ef94e906f05a..c9748f454fb7 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -575,6 +575,7 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
 		arch_kgdb_ops.disable_hw_break(regs);
 
 acquirelock:
+	rcu_read_lock();
 	/*
 	 * Interrupts will be restored by the 'trap return' code, except when
 	 * single stepping.
@@ -634,6 +635,7 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
 			atomic_dec(&slaves_in_kgdb);
 			dbg_touch_watchdogs();
 			local_irq_restore(flags);
+			rcu_read_unlock();
 			return 0;
 		}
 		cpu_relax();
@@ -652,6 +654,7 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
 		raw_spin_unlock(&dbg_master_lock);
 		dbg_touch_watchdogs();
 		local_irq_restore(flags);
+		rcu_read_unlock();
 
 		goto acquirelock;
 	}
@@ -775,6 +778,7 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
 	raw_spin_unlock(&dbg_master_lock);
 	dbg_touch_watchdogs();
 	local_irq_restore(flags);
+	rcu_read_unlock();
 
 	return kgdb_info[cpu].ret_state;
 }
-- 
2.27.0.rc2.251.g90737beb825-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
