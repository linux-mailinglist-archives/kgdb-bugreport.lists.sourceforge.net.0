Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D045420FFF0
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  1 Jul 2020 00:15:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jqOX3-0001X9-LV
	for lists+kgdb-bugreport@lfdr.de; Tue, 30 Jun 2020 22:15:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jqOX2-0001Wz-0r
 for kgdb-bugreport@lists.sourceforge.net; Tue, 30 Jun 2020 22:15:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NWmBv3YltHW/EEoBJLmtefyvNy5kBfRz96ALBdjJByA=; b=J0LkiyA5WDJY04toYODqZNH9pt
 OO4oFimc38vO/UnA5gsAgZ1cXfMT1morq9zdtnEXeSMayb1HtAbXojQ2KNjbuUP7eZ8lI4OvRj+ob
 s5ep0ti1PwYE3CykG1iHK2W07AppPW+BZSz01Iag2dC09avsCVYM/CPJYTpaqM3jlSgY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=NWmBv3YltHW/EEoBJLmtefyvNy5kBfRz96ALBdjJByA=; b=B
 gfDDZc44XY0NIy+Y6vomV8JU7NcF4oM6Fb2k76AHoCuGcwyi8JhqMrxzkMS/QUMt01Qy4uHkPdmv6
 uLMVRwOVodTmQIxZDsBe0ShQXDG7dJ1myFW0MJo+Mjqv8Hg6lWC7w4SaR0ecP8KfQ6HRCPJOQsBF6
 vsys4qokEUFDPOj0=;
Received: from mail-pg1-f195.google.com ([209.85.215.195])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jqOX0-006VaU-N3
 for kgdb-bugreport@lists.sourceforge.net; Tue, 30 Jun 2020 22:15:11 +0000
Received: by mail-pg1-f195.google.com with SMTP id f3so10632217pgr.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 30 Jun 2020 15:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NWmBv3YltHW/EEoBJLmtefyvNy5kBfRz96ALBdjJByA=;
 b=i4OC8A2NnoQYYhFSBzKGQhfcsUxIuhlLxYzhbhO1E47sANv4esb7YPdypZ78GCnRgJ
 R4jzgAYwWSLgPK+foOo5vg1fcGZCwmz6IxEXUqhm9Jmyp/DoO3nT+pFzaRt2dlwd/l2V
 Q6aloZ1x4QX4sslsEvkqFnwJgDRrYP2orzxqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NWmBv3YltHW/EEoBJLmtefyvNy5kBfRz96ALBdjJByA=;
 b=lLDjSeOAYMT2XbPBaKOKXdyHSB1f0c7pvomje3g9IeuX4p7fIMSV9jQmrXsJf+7KlS
 tQ1W4kWpcwwU7AdeliDjc38WaMLZZ/cvjyvRs0ya4u1j+O8lvsWuitEFiOh+ssDQw9J/
 rtY5kHN4Nj4Vf3M4q3h30clxTiJOHNN1zDjLaisUCx4gyvumUd7Oq5bEeEa3IQgJ6sEg
 q7YM6PtLRytpPw6DqDCT/Zq6Hc7AxNih3q3tzRiM4jZxRBosDSeD8eNkNX6pDvj0+Ofp
 yJ1G0qsW7kGmw8qT4ZYUqLl3voACCc/3uJpc5rn65rpPcGmnqtABLE7UvXmHYYzUwNd8
 1E0g==
X-Gm-Message-State: AOAM530FYapE7QaCrulXbcyO4i4vAFVtLPwBb5YSK8Wd3yuOp7gIjuQb
 19B5h9P/1Rf5KYaHiFys/fBFFQ==
X-Google-Smtp-Source: ABdhPJyKHa6qXWttCDJwtRhEezmQHkbESqhRkjZuyuXJBFKcn94rvb/rNTut0m0nWQjac2Zjcwk1fA==
X-Received: by 2002:aa7:8ac3:: with SMTP id b3mr22179202pfd.45.1593555305183; 
 Tue, 30 Jun 2020 15:15:05 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id n12sm3611295pgr.88.2020.06.30.15.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 15:15:04 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Date: Tue, 30 Jun 2020 15:14:38 -0700
Message-Id: <20200630151422.1.I4aa062751ff5e281f5116655c976dff545c09a46@changeid>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.195 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jqOX0-006VaU-N3
Subject: [Kgdb-bugreport] [PATCH] kgdb: Make "kgdbcon" work properly with
 "kgdb_earlycon"
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
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On my system the kernel processes the "kgdb_earlycon" parameter before
the "kgdbcon" parameter.  When we setup "kgdb_earlycon" we'll end up
in kgdb_register_callbacks() and "kgdb_use_con" won't have been set
yet so we'll never get around to starting "kgdbcon".  Let's remedy
this by detecting that the IO module was already registered when
setting "kgdb_use_con" and registering the console then.

As part of this, to avoid pre-declaring things, move the handling of
the "kgdbcon" further down in the file.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 kernel/debug/debug_core.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 9e5934780f41..03d5b17347da 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -94,14 +94,6 @@ int dbg_switch_cpu;
 /* Use kdb or gdbserver mode */
 int dbg_kdb_mode = 1;
 
-static int __init opt_kgdb_con(char *str)
-{
-	kgdb_use_con = 1;
-	return 0;
-}
-
-early_param("kgdbcon", opt_kgdb_con);
-
 module_param(kgdb_use_con, int, 0644);
 module_param(kgdbreboot, int, 0644);
 
@@ -920,6 +912,20 @@ static struct console kgdbcons = {
 	.index		= -1,
 };
 
+static int __init opt_kgdb_con(char *str)
+{
+	kgdb_use_con = 1;
+
+	if (kgdb_io_module_registered && !kgdb_con_registered) {
+		register_console(&kgdbcons);
+		kgdb_con_registered = 1;
+	}
+
+	return 0;
+}
+
+early_param("kgdbcon", opt_kgdb_con);
+
 #ifdef CONFIG_MAGIC_SYSRQ
 static void sysrq_handle_dbg(int key)
 {
-- 
2.27.0.212.ge8ba1cc988-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
