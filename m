Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E73A21BCEE0
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 28 Apr 2020 23:37:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jTXv7-0005K1-OJ
	for lists+kgdb-bugreport@lfdr.de; Tue, 28 Apr 2020 21:37:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jTXv6-0005Jn-Gr
 for kgdb-bugreport@lists.sourceforge.net; Tue, 28 Apr 2020 21:37:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0OVNvnisfgkYu5LPJfO/kG/+xFAcsPKgHoSUZfW5y90=; b=H55o7ZaFC0pW3zpq3QVJP1SKcw
 chYL7ii7tcoz1+A4l6jikx0YFJbK2YFIrYCnDcH1JjOO6Wxk4e3fedHm7/tierL42KnE+IMQ1DiZC
 frYneQOJLnphpYZ8RIewoIvYdA4C8krHDHAze7+j3Y5Qi/M6dvFhMI+EGqqTeJERt+oM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0OVNvnisfgkYu5LPJfO/kG/+xFAcsPKgHoSUZfW5y90=; b=gN7TvZ94LDTuItA0Iw1CVdLxqb
 5hya0gwxvWBz4FUPhE1lNYIOS828n3FQGbSbCxpkdtVtr7TmoPjxMrgZJ50juqDFyudw09GtFMGGG
 n9iiQB9vP7IOmRjzWB8N10rIJt6re2P2XoaJ5cAb9m1KzzLHO8M1RehDEK+2+7in5AJA=;
Received: from mail-pg1-f194.google.com ([209.85.215.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jTXv5-0030he-17
 for kgdb-bugreport@lists.sourceforge.net; Tue, 28 Apr 2020 21:37:36 +0000
Received: by mail-pg1-f194.google.com with SMTP id d17so11143230pgo.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 28 Apr 2020 14:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0OVNvnisfgkYu5LPJfO/kG/+xFAcsPKgHoSUZfW5y90=;
 b=h/doTU1qG1diDauaG4awPo0siVlKxs5d3hJ4lnA8tM0J401L3v3bBQmJoeyedEqXwb
 51qxQobOPjOp0YRYa5DgkvyAUSbSbtN8u8KC6zK6J0bnGAluamUTpb+thPIv8ZnZ6hHp
 Agc3yHDWqkGWoApmfRi9iFjYsxh8LUGVylncM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0OVNvnisfgkYu5LPJfO/kG/+xFAcsPKgHoSUZfW5y90=;
 b=asBBa4E1lu5coQ16/JhtxW9+FMaQmFupDm6uUxkC47OfXxT6WGA0fPh/3xLrlHxVUB
 0PIaPHbtS0Z7MkUUoWAWr81sQ+OyXNJm77jwt8SWJZmn0wQp17kZCq3TXFOYanYaHuzL
 0p9deXA8OFqErp9OljhLliXYOJilUhJGr4hqcflgjbq1dsUkhFosNAZlFYMcUkXBOzMz
 8hTLyRMnC/xCB9oQiFvjVtKC9BB9nB1G4rqeE/87hWs+lxVRUnUS8STwceARcLC1dzU9
 Lb0GoA2pFKhMWhOHP84dcnfl4Anup1QFBk6P2R3Ow93BNDJ9it+BM7CKQSQ1I+l8Vbh9
 eOuQ==
X-Gm-Message-State: AGi0Pub6Cq9oNZ1JNv++K+hk1+Yz7JVbwfJhP9gwoUwTQbJ18sSHF5PS
 bLUR+Wx3MZQMEMp6WF4nFPLVaVNbWJQkDw==
X-Google-Smtp-Source: APiQypICBO33ruUlGkSJaFNPeFlv0L/gbSK0rXL8fq3M4//PGxHAL3DVuuFb8F/+QnhjSj2tyQD97w==
X-Received: by 2002:a17:902:bd09:: with SMTP id
 p9mr18601373pls.214.1588108460637; 
 Tue, 28 Apr 2020 14:14:20 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id 18sm2988202pjf.30.2020.04.28.14.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 14:14:20 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 gregkh@linuxfoundation.org
Date: Tue, 28 Apr 2020 14:13:42 -0700
Message-Id: <20200428141218.v3.2.I02258eee1497e55bcbe8dc477de90369c7c7c2c5@changeid>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
In-Reply-To: <20200428211351.85055-1-dianders@chromium.org>
References: <20200428211351.85055-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.194 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jTXv5-0030he-17
Subject: [Kgdb-bugreport] [PATCH v3 02/11] Revert "kgdboc: disable the
 console lock when in kgdb"
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
Cc: corbet@lwn.net, kgdb-bugreport@lists.sourceforge.net, hpa@zytor.com,
 bjorn.andersson@linaro.org, agross@kernel.org, bp@alien8.de,
 linux-serial@vger.kernel.org, catalin.marinas@arm.com, jslaby@suse.com,
 tglx@linutronix.de, will@kernel.org, mingo@redhat.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

This reverts commit 81eaadcae81b4c1bf01649a3053d1f54e2d81cf1.

Commit 81eaadcae81b ("kgdboc: disable the console lock when in kgdb")
is no longer needed now that we have the patch ("kgdb: Disable
WARN_CONSOLE_UNLOCKED for all kgdb").  Revert it.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---

Changes in v3: None
Changes in v2:
- ("Revert "kgdboc: disable the console lock when in kgdb"") new for v2.

 drivers/tty/serial/kgdboc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index c9f94fa82be4..8a1a4d1b6768 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -275,14 +275,10 @@ static void kgdboc_pre_exp_handler(void)
 	/* Increment the module count when the debugger is active */
 	if (!kgdb_connected)
 		try_module_get(THIS_MODULE);
-
-	atomic_inc(&ignore_console_lock_warning);
 }
 
 static void kgdboc_post_exp_handler(void)
 {
-	atomic_dec(&ignore_console_lock_warning);
-
 	/* decrement the module count when the debugger detaches */
 	if (!kgdb_connected)
 		module_put(THIS_MODULE);
-- 
2.26.2.303.gf8c07b1a785-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
