Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A94221DEA6E
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 22 May 2020 16:55:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jc955-0001W6-RD
	for lists+kgdb-bugreport@lfdr.de; Fri, 22 May 2020 14:55:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jc954-0001Vx-B8
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 May 2020 14:55:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kkTz4sTk7s012DbHMp3X0LwsnQSwOjg9lEMirTJ/PWk=; b=XALO93atKAnnv3W+dTCkQWf9vl
 nV74YyAu7Dg0vqG+IjELCpmql+hv6KUtU0smlE3jPAwgt+NwMKts+GW5+1u/i78N5j8StHIIye5xG
 WUqCY5jhGII96d7pki+MX8+jgriCk4Hp9cfjoY/s16cZQ5ix/8lgMgIL2zsm54lRODAg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kkTz4sTk7s012DbHMp3X0LwsnQSwOjg9lEMirTJ/PWk=; b=fwI+BrtSBcQ5+a0+7adb3zVmRA
 Es4bGiONBnwcF3phGKcCMN5nik9yjHNtj9oV74k8Bpa1Sva2Ep2K0bmfUu46cGTJksjZdNDmZi+a8
 NDxaOiF6K2iZnse0YrEJALE2udFmw9zq2p6emrkewt9lCCiCW9bigvxp55MUu59JiRHo=;
Received: from mail-wm1-f68.google.com ([209.85.128.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jc951-002QHG-AW
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 May 2020 14:55:26 +0000
Received: by mail-wm1-f68.google.com with SMTP id f13so8898285wmc.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 22 May 2020 07:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kkTz4sTk7s012DbHMp3X0LwsnQSwOjg9lEMirTJ/PWk=;
 b=CmyoV4DakSUdEOfu7cjPJzdTIPnJ6TKlRfsXiilcn49CqPDcUOzFGX9DBib2tD3/pm
 QApEtLdvp6Fa4KNTp/oT0fEOwbQWtU5CZ3x2SCCeUD/WspsDejdt5xibpZ3dKW+8N9vd
 wpMgNvOZId9/GA5XVtZF4Lq5us4bbMV8sDPJ0/XlIQLKxCHSnelKR8n1Ie62Om5LxWUl
 EQYUU91KChW8wkfIxjdDK6WH+98E07MH6kLCa43YRIb/FcPg4qpXBzBKU46RZRSX/jmR
 1g6SynQVCCRNNQZhm8gmkXSfMar3NbaV1LuIrwazVbgceNf5GLdXyLQ2URJ4NKjQlMdB
 t4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kkTz4sTk7s012DbHMp3X0LwsnQSwOjg9lEMirTJ/PWk=;
 b=Le+DRAHU3yUPWhoZ4l6HQOnp14b2amI1EcW3DrHJd7nqek/haHz3p1QtaWMJwvSyyd
 lV6n+M8AAjCfFLGUnIuZ7nsssCY+j8kNvoSezwaTE/nAz2b8CVoHY6wj7Th9ygQtVkpu
 tJh7rfUl9syZLxsl9m+MwHz8e67KOZDyWHknYYFphSiXMPrnxK05f7Wbaq2r/wizv126
 7h7kUHU6B2sm02xfFpExO9zR9RkEeGvjHhoFkMjHlwUBNZkRk35/NxFouHsCN9wVL+TT
 iVAyhLSLIjRqTNYo3hmqJaz5Vd+2CGCeVoGPilP3BhcwUCQ4FXv1Mlld76OPsqVymu17
 7Dxw==
X-Gm-Message-State: AOAM532tivVXDicVqePkMVnb1B9U7aZ4/3RjjfFuH/p2kz60Gn7CITUX
 l7Y98n0vaq/o+ygpdn7IsBRrMQ==
X-Google-Smtp-Source: ABdhPJxQXqSFq49qzrvg5dJHfbQcmZrcW5ufJyiYOXZjrM7OJFBvSL22Ako9KERokDxGdIZxZR7/nA==
X-Received: by 2002:a1c:25c3:: with SMTP id
 l186mr13757890wml.103.1590159316931; 
 Fri, 22 May 2020 07:55:16 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id i21sm9746911wml.5.2020.05.22.07.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 07:55:16 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: sumit.garg@linaro.org, jason.wessel@windriver.com, dianders@chromium.org
Date: Fri, 22 May 2020 15:55:10 +0100
Message-Id: <20200522145510.2109799-3-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200522145510.2109799-1-daniel.thompson@linaro.org>
References: <20200522145510.2109799-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jc951-002QHG-AW
Subject: [Kgdb-bugreport] [RFC PATCH 2/2] locking/spinlock/debug: Add checks
 for kgdb trap safety
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
Cc: pmladek@suse.com, Daniel Thompson <daniel.thompson@linaro.org>,
 patches@linaro.org, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 sergey.senozhatsky@gmail.com, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

In general it is not safe to call spin_lock() whilst executing in the
kgdb trap handler. The trap can be entered from all sorts of execution
context (NMI, IRQ, irqs disabled, etc) and the kgdb/kdb needs to be
as resillient as possible.

Currently it is difficult to spot mistakes in the kgdb/kdb logic
(especially so for kdb because it uses more kernel features than
pure-kgdb). Let's provide a means to bring attention to deadlock
risks in the debug code.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 include/linux/kgdb.h            | 16 ++++++++++++++++
 kernel/locking/spinlock_debug.c |  4 ++++
 lib/Kconfig.kgdb                | 11 +++++++++++
 3 files changed, 31 insertions(+)

diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
index b072aeb1fd78..de30ce8078cf 100644
--- a/include/linux/kgdb.h
+++ b/include/linux/kgdb.h
@@ -332,4 +332,20 @@ extern void kgdb_panic(const char *msg);
 #define dbg_late_init()
 static inline void kgdb_panic(const char *msg) {}
 #endif /* ! CONFIG_KGDB */
+
+#ifdef CONFIG_KGDB_DEBUG_SPINLOCK
+/**
+ * check_kgdb_context_before() - Check whether to issue a spinlock warning
+ *
+ * Currently this only reports when the master processor violates the
+ * locking rules (because we are using the in_dbg_master() macro since
+ * we are confident that will avoid false positives).
+ *
+ * Return: True if we are executing in the debug trap
+ */
+static inline int check_kgdb_context_before(void) { return in_dbg_master(); }
+#else
+static inline int check_kgdb_context_before(void) { return 0; }
+#endif
+
 #endif /* _KGDB_H_ */
diff --git a/kernel/locking/spinlock_debug.c b/kernel/locking/spinlock_debug.c
index b9d93087ee66..b49789e0fed8 100644
--- a/kernel/locking/spinlock_debug.c
+++ b/kernel/locking/spinlock_debug.c
@@ -12,6 +12,7 @@
 #include <linux/debug_locks.h>
 #include <linux/delay.h>
 #include <linux/export.h>
+#include <linux/kgdb.h>
 
 void __raw_spin_lock_init(raw_spinlock_t *lock, const char *name,
 			  struct lock_class_key *key, short inner)
@@ -84,6 +85,7 @@ debug_spin_lock_before(raw_spinlock_t *lock)
 	SPIN_BUG_ON(READ_ONCE(lock->owner) == current, lock, "recursion");
 	SPIN_BUG_ON(READ_ONCE(lock->owner_cpu) == raw_smp_processor_id(),
 							lock, "cpu recursion");
+	SPIN_BUG_ON(check_kgdb_context_before(), lock, "in debug trap");
 }
 
 static inline void debug_spin_lock_after(raw_spinlock_t *lock)
@@ -174,6 +176,7 @@ int do_raw_read_trylock(rwlock_t *lock)
 void do_raw_read_unlock(rwlock_t *lock)
 {
 	RWLOCK_BUG_ON(lock->magic != RWLOCK_MAGIC, lock, "bad magic");
+	RWLOCK_BUG_ON(check_kgdb_context_before(), lock, "in debug trap");
 	arch_read_unlock(&lock->raw_lock);
 }
 
@@ -183,6 +186,7 @@ static inline void debug_write_lock_before(rwlock_t *lock)
 	RWLOCK_BUG_ON(lock->owner == current, lock, "recursion");
 	RWLOCK_BUG_ON(lock->owner_cpu == raw_smp_processor_id(),
 							lock, "cpu recursion");
+	RWLOCK_BUG_ON(check_kgdb_context_before(), lock, "in debug trap");
 }
 
 static inline void debug_write_lock_after(rwlock_t *lock)
diff --git a/lib/Kconfig.kgdb b/lib/Kconfig.kgdb
index 933680b59e2d..4d57900d6c53 100644
--- a/lib/Kconfig.kgdb
+++ b/lib/Kconfig.kgdb
@@ -29,6 +29,17 @@ config KGDB_SERIAL_CONSOLE
 	  Share a serial console with kgdb. Sysrq-g must be used
 	  to break in initially.
 
+config KGDB_DEBUG_SPINLOCK
+	bool "KGDB: Check for spin lock usage when system is halted"
+	select DEBUG_SPINLOCK
+	default n
+	help
+	  Say Y here to catch spin lock waiting when we are running
+	  in the kgdb trap handler and report it. When the trap handler
+	  is executing all other system activity is halted and spin lock
+	  contention will lead to deadlock. This makes any spin lock wait
+	  from this execution context risky.
+
 config KGDB_TESTS
 	bool "KGDB: internal test suite"
 	default n
-- 
2.25.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
