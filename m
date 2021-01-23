Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 20119303925
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 26 Jan 2021 10:39:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l4Kop-0008N3-R6
	for lists+kgdb-bugreport@lfdr.de; Tue, 26 Jan 2021 09:39:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <emil.renner.berthing@gmail.com>) id 1l3NsR-0006xK-Pz
 for kgdb-bugreport@lists.sourceforge.net; Sat, 23 Jan 2021 18:43:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HtWUULD+AqAM7T9i0ash0maTbZaHA0HTT6y5oFghtDY=; b=L+KhJCqSepVRoeCLjIkC6++jbH
 FegRbixMfk491tvWHkWrvMzhzg4SvDE/+/Bmx7UKfQv4//iXr05L70psp1SNa3tC3h7XS/4Ohy3vu
 rdQM2fVrjbvZiRtLQTB9rooI0ZmTi1+QX70uWgMjiX8p2bc9WXHyLfpl165nHr703jWA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=HtWUULD+AqAM7T9i0ash0maTbZaHA0HTT6y5oFghtDY=; b=a
 lnBcyP7phrriJC6aEUB7VdPSMyBGyLf3UIqMY60JZgT+hs9d0GhXHR3sOloERh44Ni1qgwIkqSpOR
 u0m89TynVa4tDF0uM6StJqvczZu4o+GaH7ejQ5MQXyl0bBSfSAvy/SKwe9x28v7OvmNQ6R6F/Z6aF
 mbV5/z/Iw4XtHOEE=;
Received: from mail-ed1-f45.google.com ([209.85.208.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l3NsM-00FUpz-0d
 for kgdb-bugreport@lists.sourceforge.net; Sat, 23 Jan 2021 18:43:15 +0000
Received: by mail-ed1-f45.google.com with SMTP id b21so10435069edy.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sat, 23 Jan 2021 10:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HtWUULD+AqAM7T9i0ash0maTbZaHA0HTT6y5oFghtDY=;
 b=cXczeMGfY9s9XYao4Ximr5BQuDurR5O++FPJ+CYgI2f4meOT9bUkkX/WkV34EEYYyI
 ipasFxgoRp66w6x2D7kThbWUTB/8PmKGF8rpEXshlSZnGVQL5hpK1A9jyMiTHZDTihXu
 mbDamduLQEExNeoX7rvfxsXyep38S8ulfE6Xew6HfAjRk+Rr0xdc4FYPUGMWQlftjuEr
 BEnUOvEUrU8y4rkAuSBL5eoUMOlVvPpZYCQhnPBN9c+7RHQ5ApYDu5/ul/RLi650ETBF
 ap/3wb8wZB2ddisIXUbHgNb6uQd6kdYOBFJ78qBt9o7XRDTsRZOrQsfQjgpncUBosolY
 gZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=HtWUULD+AqAM7T9i0ash0maTbZaHA0HTT6y5oFghtDY=;
 b=pgbKR9DEGaTsKc3pImS6iZfZ+/4Akkt+J3tCwRyTJiNbUWn9zICNhbzcby8mo73ahV
 dR51tAAzFBgXeLWpVMct69+u9hzUjpCF8B120H72Zf+7NdHrs6kAhhbbzpKLMeOiKvLj
 EZugYlby+dQe6iPd5zcDFK4hl7gvYQ7t7EcZYmJxvAz10l8cgW5MYekFm44FPAAbbE7l
 xoPiBfptvoqC1gsekZgSJT2oX6jJ8j9GYUX3wWFK4mWFSfPyhw+n7xVr+jG86P4GCIXq
 zUawr+UuyuIv7u2kUEW8MqI6vASAL6jGr2N+JzHPmSfVEECvSUol5iRLi7RF/UGpetmI
 nXVw==
X-Gm-Message-State: AOAM531RT+VUGUKrkiRlbzEw281zAKGV/+LA7FsURP4mKeDo5BrTVf6B
 jwlpLsqBkkabtHyqJ4mnCtarjsAc4Fo0+Q==
X-Google-Smtp-Source: ABdhPJycl+scqeQDd4xouRA/sGeVpcIAvspo6fwlEkJbccyjKk+npd1nlpM3QXSKYpIx8GvsY74Akw==
X-Received: by 2002:a05:6402:5112:: with SMTP id
 m18mr7857015edd.129.1611427383695; 
 Sat, 23 Jan 2021 10:43:03 -0800 (PST)
Received: from stitch.. ([2a01:4262:1ab:c:78d8:2ef4:5ead:12bd])
 by smtp.gmail.com with ESMTPSA id y59sm8003109ede.59.2021.01.23.10.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 10:43:03 -0800 (PST)
From: Emil Renner Berthing <kernel@esmil.dk>
To: kgdb-bugreport@lists.sourceforge.net
Date: Sat, 23 Jan 2021 19:42:37 +0100
Message-Id: <20210123184237.6970-1-kernel@esmil.dk>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (emil.renner.berthing[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.45 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: esmil.dk]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.45 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
X-Headers-End: 1l3NsM-00FUpz-0d
X-Mailman-Approved-At: Tue, 26 Jan 2021 09:39:24 +0000
Subject: [Kgdb-bugreport] [PATCH] kgdb: use new API for breakpoint tasklet
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
Cc: linux-kernel@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

This converts the kgdb_tasklet_breakpoint to use the new API in
commit 12cc923f1ccc ("tasklet: Introduce new initialization API")

The new API changes the argument passed to the callback function, but
fortunately the argument isn't used so it is straight forward to use
DECLARE_TASKLET() rather than DECLARE_TASKLET_OLD().

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 kernel/debug/debug_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index af6e8b4fb359..98d44c2bb0a4 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -1090,13 +1090,13 @@ static void kgdb_unregister_callbacks(void)
  * such as is the case with kgdboe, where calling a breakpoint in the
  * I/O driver itself would be fatal.
  */
-static void kgdb_tasklet_bpt(unsigned long ing)
+static void kgdb_tasklet_bpt(struct tasklet_struct *unused)
 {
 	kgdb_breakpoint();
 	atomic_set(&kgdb_break_tasklet_var, 0);
 }
 
-static DECLARE_TASKLET_OLD(kgdb_tasklet_breakpoint, kgdb_tasklet_bpt);
+static DECLARE_TASKLET(kgdb_tasklet_breakpoint, kgdb_tasklet_bpt);
 
 void kgdb_schedule_breakpoint(void)
 {
-- 
2.30.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
