Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A25EF615B
	for <lists+kgdb-bugreport@lfdr.de>; Sat,  9 Nov 2019 21:22:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iTXFl-0007FK-Tg
	for lists+kgdb-bugreport@lfdr.de; Sat, 09 Nov 2019 20:22:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1iTXFj-0007FC-Uz
 for kgdb-bugreport@lists.sourceforge.net; Sat, 09 Nov 2019 20:22:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mXFzTIQULMmuTDmTZ6dVKohz/gl+dRtj6ccr6Op88KM=; b=GJK5QhkqcrSheidwYELZAW2esM
 ArfoLEqZ5iYqea5FW7N3dHBcIHnv/7ZlUF1jQtyJ4hD0Lila6D9JZ1hxGIqfLuaYCLwC0oDRyerTC
 H5e8QgNldxgRHM/5vamoca1tVf1znkDgrBJ5nWrQN4sl8MY+6VLnpqBnNJYa6Ucxt/rg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mXFzTIQULMmuTDmTZ6dVKohz/gl+dRtj6ccr6Op88KM=; b=BpqLG55AR9szwnfgSQObdxDucG
 8y4EN3VPtwS6pOqsaErYwHIqTfOfaO4wU06io79fsKd0s4JBJGW0aB5n0ADaorr2Q5BMEV2BnF3sD
 Q4YrqrS+kPhVCQf3zKTZrRLhgZULFM+L/A6/UPNQws4u4++AP2lKDJHenjZENGJ1dhTU=;
Received: from mail-qv1-f66.google.com ([209.85.219.66])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iTXFi-009sdH-LQ
 for kgdb-bugreport@lists.sourceforge.net; Sat, 09 Nov 2019 20:22:35 +0000
Received: by mail-qv1-f66.google.com with SMTP id c9so3509715qvz.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sat, 09 Nov 2019 12:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mXFzTIQULMmuTDmTZ6dVKohz/gl+dRtj6ccr6Op88KM=;
 b=LI5ozv1fTxbjr7x/dcDUh1mB2Iwxyf2fpfKuXvFQulIkd9YYm2IU8paiccu3EotNtk
 wDJqmbFshW43M/V4r+iGHGDG6uw/mJwvq0g2eyrCfenSMsNd3qcwuHmUVNq/PlOW7tvy
 1pLLqJgWNfjC/p5racDr1lFjxnY0r9jZw5HQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mXFzTIQULMmuTDmTZ6dVKohz/gl+dRtj6ccr6Op88KM=;
 b=o+cAZEs7YYRBr+qCKmszdbDpHHGUSoRF0oPQeetdXUTud/F+xHyL+b1zDTf+wB9SYj
 P+MWwqOrnlS+AU5cSwfcFmoiXGvKU/LMvhgc8av1Qhpz05qwHzqPuH73U9ApW2+C/1+j
 YZjHpz59r7Q4RE+iA9CCgMbhszS1sfDzdoOQNs2bSIykHuoaVuKldfzyxOpxSDvMMRiR
 4vW2SOqUZ/xlXVNNhgSOxbonUJbg7bU9yft9vqYt7Iela8RaO19Digdh2AFMlo1zxg7x
 ITI19POIDxsEZRVe+vHh5nd0kRzs2RVvP03RJ+wQl/hz0kVcUb9KGnPcWvdR8q2td/y4
 3gJQ==
X-Gm-Message-State: APjAAAXw2nmT6/Lq/4LaEaEvLfHp5neHoxSKoAzERo56PzoEABlh7ohe
 fxET1ZxLR18frO2lnMjIUxGK9QQAf78=
X-Google-Smtp-Source: APXvYqyJ/5A4gHEs+sAnhcIJcA/HukdqC84S1VJK0RNlrtJ8DJl9XngaqApx43e536fdHhCsG/SlEA==
X-Received: by 2002:a63:ec4b:: with SMTP id r11mr19367156pgj.147.1573327070394; 
 Sat, 09 Nov 2019 11:17:50 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id i11sm9193577pgd.7.2019.11.09.11.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2019 11:17:49 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Paul Burton <paul.burton@mips.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>
Date: Sat,  9 Nov 2019 11:16:41 -0800
Message-Id: <20191109111623.2.Iadbfb484e90b557cc4b5ac9890bfca732cd99d77@changeid>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
In-Reply-To: <20191109191644.191766-1-dianders@chromium.org>
References: <20191109191644.191766-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iTXFi-009sdH-LQ
Subject: [Kgdb-bugreport] [PATCH 2/5] kdb: kdb_current_regs should be private
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
Cc: qiaochong@loongson.cn, Prarit Bhargava <prarit@redhat.com>,
 kgdb-bugreport@lists.sourceforge.net, ralf@linux-mips.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

As of the patch ("MIPS: kdb: Remove old workaround for backtracing on
other CPUs") there is no reason for kdb_current_regs to be in the
public "kdb.h".  Let's move it next to kdb_current_task.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 include/linux/kdb.h            | 2 --
 kernel/debug/kdb/kdb_private.h | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/kdb.h b/include/linux/kdb.h
index 68bd88223417..24cd447659e0 100644
--- a/include/linux/kdb.h
+++ b/include/linux/kdb.h
@@ -183,8 +183,6 @@ int kdb_process_cpu(const struct task_struct *p)
 	return cpu;
 }
 
-/* kdb access to register set for stack dumping */
-extern struct pt_regs *kdb_current_regs;
 #ifdef CONFIG_KALLSYMS
 extern const char *kdb_walk_kallsyms(loff_t *pos);
 #else /* ! CONFIG_KALLSYMS */
diff --git a/kernel/debug/kdb/kdb_private.h b/kernel/debug/kdb/kdb_private.h
index 55d052061ef9..e829b22f3946 100644
--- a/kernel/debug/kdb/kdb_private.h
+++ b/kernel/debug/kdb/kdb_private.h
@@ -242,6 +242,7 @@ extern void debug_kusage(void);
 
 extern void kdb_set_current_task(struct task_struct *);
 extern struct task_struct *kdb_current_task;
+extern struct pt_regs *kdb_current_regs;
 
 #ifdef CONFIG_KDB_KEYBOARD
 extern void kdb_kbd_cleanup_state(void);
-- 
2.24.0.432.g9d3f5f5b63-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
