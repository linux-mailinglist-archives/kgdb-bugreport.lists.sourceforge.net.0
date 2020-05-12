Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A4A1CEF76
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 12 May 2020 10:49:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jYQbI-00050s-Gd
	for lists+kgdb-bugreport@lfdr.de; Tue, 12 May 2020 08:49:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jYQbH-00050e-D3
 for kgdb-bugreport@lists.sourceforge.net; Tue, 12 May 2020 08:49:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t97yRHpmHo8412WgRauzgIXQjp1lspYvNliDKxac5o8=; b=ADfU8VvvzeiwzMGWD2QOSiPspl
 rqyRDG7jp98Fm9JpMiy3gX+HU5QCTwATAIBmmjZ6Vdsifqf3CKzRVAjF73+0tx4vL7a4zoyMWR/dF
 fjcbMRSHhMEnhaHedmXfhI97Bm3eEUbqJ7buBAaYdofRjzw7xvXfxvxUd+tlSM1bQb2M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t97yRHpmHo8412WgRauzgIXQjp1lspYvNliDKxac5o8=; b=nU6jSedn2EnWSETD2Rr16pAa8x
 x2eAN38rkKvBe9DcMjCpOrAsRufwqO2mf5EXRqAwM99seHbAlAAdXwJUSYuiT3f0286Xo0Ojr/fzN
 R9Qn1MddDLIb/KrDLWFopuhyo3zXH74wjHmlmUfSB4vt6gbeCiNfH+NRKPNn89s8cWSY=;
Received: from mail-pg1-f196.google.com ([209.85.215.196])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jYQbD-005rNf-9B
 for kgdb-bugreport@lists.sourceforge.net; Tue, 12 May 2020 08:49:19 +0000
Received: by mail-pg1-f196.google.com with SMTP id p21so3112pgm.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 12 May 2020 01:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=t97yRHpmHo8412WgRauzgIXQjp1lspYvNliDKxac5o8=;
 b=gr42BgPt6fH1p27tOaC1DScaH67NkLMkrYxnzMUkrwYYxLwiu82+rNiSSDGp3LwtAf
 hbp0nI1k6l7eH5+YKzgzpxDEcKZlxPutlQxWNVN4Qucn/LIppB45rD9wuVYlDvTGoQJu
 ndVN221ndSVWUvbDeG4Y79IeH2z6kM4dvFBw4QYVKWN6y+3AezfVpySHgx92JlXnhWlL
 KszvYITck8HhhV+vrhuht1XSRcDsG+6irVnuQmdqhXe8UaUrmgPdHVBmnasfWeX8Y6gN
 CuU8qoiZ7Kh3OwrURwe7lYJGIdVtdoTwCV5PANs0mlje4XGdNQ1JamoBm8AZ25pp/7Pa
 pNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=t97yRHpmHo8412WgRauzgIXQjp1lspYvNliDKxac5o8=;
 b=V30XqbqnELIF1aSosw4aumULPYEaY5UDHTnjmhC5t9v/VefK4eFpOFbH/5zrM2zKG7
 VTfPYVOt92bedxdVIQy+R+vujR+IzpgSlL+ovHeiZOutwyTJDBiyCg6/Z2h3+juKzz/z
 H5Oswn0QDvPcKNL7QCnlkCz1oKl1z2YAQ2O3RuiN7rHAIs8+OjdFamme5DnFNeRvpGEK
 af9++7EPMspdDkX0goelNkhyC9A3SbDU/426Y+XyFrp7Zr+ANkdh6WEa7iz7Ssz35c7H
 WGQxMwDup9YFn3cB9t0TD8vRJqSTfaE3pETsHafRgRNiF5270uDceHUTJUhVp1ERquYQ
 TkqA==
X-Gm-Message-State: AGi0PuYSXsBcklz6COrOqSXkPCgEnRpPxi4yfvo2uXxuA/dH4sq2uRYc
 OJzlU1VCzSigbijLd1DOR7ZTTg==
X-Google-Smtp-Source: APiQypKCDzca+eCTQuciTT43aXbflnxzTa53g95PcTkGD9z0CskYBxnkXGY5zeFv+78SchqWqu8zcw==
X-Received: by 2002:a62:e80e:: with SMTP id c14mr19361183pfi.83.1589273349558; 
 Tue, 12 May 2020 01:49:09 -0700 (PDT)
Received: from localhost.localdomain ([117.196.230.85])
 by smtp.gmail.com with ESMTPSA id 188sm11320866pfg.218.2020.05.12.01.49.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 May 2020 01:49:08 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: daniel.thompson@linaro.org, jason.wessel@windriver.com,
 dianders@chromium.org
Date: Tue, 12 May 2020 14:18:34 +0530
Message-Id: <1589273314-12060-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jYQbD-005rNf-9B
Subject: [Kgdb-bugreport] [PATCH] kgdb: Fix broken handling of printk() in
 NMI context
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Since commit 42a0bb3f7138 ("printk/nmi: generic solution for safe printk
in NMI"), kgdb entry in NMI context defaults to use safe NMI printk()
which involves CPU specific buffers and deferred printk() until exit from
NMI context.

But kgdb being a stop-the-world debugger, we don't want to defer printk()
especially backtrace on corresponding CPUs. So instead switch to normal
printk() mode in kgdb_cpu_enter() if entry is in NMI context.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---

Similar change was posted earlier specific to arm64 here [1]. But after
discussions it emerged out that this broken handling of printk() in NMI
context should be a common problem that is relevant to other archs as well.
So fix this handling in kgdb_cpu_enter() as there can be multiple entry
points to kgdb in NMI context.

[1] https://lkml.org/lkml/2020/4/24/328

 kernel/debug/debug_core.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 2b7c9b6..ab2933f 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -567,6 +567,15 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
 	kgdb_info[ks->cpu].enter_kgdb++;
 	kgdb_info[ks->cpu].exception_state |= exception_state;
 
+	/*
+	 * kgdb entry in NMI context defaults to use safe NMI printk() which
+	 * involves CPU specific buffers and deferred printk() until exit from
+	 * NMI context. But kgdb being a stop-the-world debugger, we don't want
+	 * to defer printk(). So instead switch to normal printk() mode here.
+	 */
+	if (in_nmi())
+		printk_nmi_exit();
+
 	if (exception_state == DCPU_WANT_MASTER)
 		atomic_inc(&masters_in_kgdb);
 	else
@@ -635,6 +644,8 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
 			atomic_dec(&slaves_in_kgdb);
 			dbg_touch_watchdogs();
 			local_irq_restore(flags);
+			if (in_nmi())
+				printk_nmi_enter();
 			return 0;
 		}
 		cpu_relax();
@@ -772,6 +783,8 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
 	raw_spin_unlock(&dbg_master_lock);
 	dbg_touch_watchdogs();
 	local_irq_restore(flags);
+	if (in_nmi())
+		printk_nmi_enter();
 
 	return kgdb_info[cpu].ret_state;
 }
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
