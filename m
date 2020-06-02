Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D3F1EC2F8
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  2 Jun 2020 21:41:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jgCml-0002Q9-Ng
	for lists+kgdb-bugreport@lfdr.de; Tue, 02 Jun 2020 19:41:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jgCmk-0002Pq-9h
 for kgdb-bugreport@lists.sourceforge.net; Tue, 02 Jun 2020 19:41:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sErQwKMHt7iGLm2dkUe7i9Rye2SnJsz1zTCi4R7MuJo=; b=h7xHzuK/PCUeBh3G1PvolKn5x2
 xi0KZuaW6L/1chlybblJXMAb79niLVIqhn0IH5yMV4W4EMZvF8/kobWY4Z0CmG6ieTXdyGgx4mGcf
 JDtEvdQThWVbxWASxMevdbQwE/LLU26a02lr3yfwV0uZdWwAEWtVqW2lE3w3hItHzIEQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=sErQwKMHt7iGLm2dkUe7i9Rye2SnJsz1zTCi4R7MuJo=; b=k
 PWzqCj4MtEeaCftntn4myexeBtMo7LszY+6TRG1mdpaGumfn52UGsB3BRvLqcxwcCqZ29pGx4INMW
 7j5JwTWp4Qnh7QPgZCiMpXAtKjgohGb6fWWIeSC69hLgFqaov7xJ0PP/MEStIMUNphiyQWMA2d60V
 Ziy9SpWNwGaUtZYs=;
Received: from mail-pf1-f195.google.com ([209.85.210.195])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jgCmi-0031w9-73
 for kgdb-bugreport@lists.sourceforge.net; Tue, 02 Jun 2020 19:41:18 +0000
Received: by mail-pf1-f195.google.com with SMTP id d66so5662178pfd.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 02 Jun 2020 12:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sErQwKMHt7iGLm2dkUe7i9Rye2SnJsz1zTCi4R7MuJo=;
 b=E3gsKcsgv6/Srf1A1gu6zEoSliyxZlDuNhy/OP5M/2ndpyXT9P1dvGeDFz9AwT70TJ
 d/tSrWWziiKlSy83j1afTohsy+zdSWBZzFVzEQdsovPTiWpvVFtk9OP/eAutFukZ7ee2
 sx5oGL87Ca7tQTzPJ4xfAIMkNKn63dOaBGx2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sErQwKMHt7iGLm2dkUe7i9Rye2SnJsz1zTCi4R7MuJo=;
 b=QhlvKhQOb0W/aMZ9OSIaWv+XtpCZOuCXk3mi7vUi1xMo+fvLvVZtoHkmV1FxWTXU6i
 WdBUaAA9rsTF80M+OcTi404MAMsS3v8pH4RzsFECRh7Y16zNG0oVGetnQczgYRv4ERPz
 norO35STnK0MFXNeA+3AYJdltrMPiaDpAbh2TGvN+v0jiQdEbmDBXXD/G+s5HN0noxu7
 lVGafwJ91jKJTRdHH4pVs8xWzSeZCxUME6+evlXCwGli9jjFGGc/N/82azlGZBzaDyls
 y1QqAcBJo/89dm2CMKE3QDwjVRvtMZ+6V/Xfycf0wXkDnXETzlduurOb+Pcpq27U1Ed0
 l7CA==
X-Gm-Message-State: AOAM533zRT9Xi5PWOvIdlH7EqrIi7imtLGgF227Vcl+fPYmKLqmebVEx
 MxiMlp9/cp4RGWxQmHKN+aYCVQ==
X-Google-Smtp-Source: ABdhPJzkajkv6lkdxaEr5KKelaECEixaFCdukA9P7kLW3mm4vqllhyX6Oxnj1ZYiAUVkLPzMFIO/Aw==
X-Received: by 2002:a63:3859:: with SMTP id h25mr25618661pgn.370.1591126869771; 
 Tue, 02 Jun 2020 12:41:09 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id gv4sm2998073pjb.6.2020.06.02.12.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 12:41:09 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Date: Tue,  2 Jun 2020 12:40:48 -0700
Message-Id: <20200602124044.1.Iee31247bc080d42a02e167454b1225a1b4283705@changeid>
X-Mailer: git-send-email 2.27.0.rc2.251.g90737beb825-goog
MIME-Version: 1.0
X-Spam-Score: 2.4 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.195 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jgCmi-0031w9-73
Subject: [Kgdb-bugreport] [PATCH] serial: kgdboc: Fix bad line wrapping in
 comment
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
Cc: kgdb-bugreport@lists.sourceforge.net, Jiri Slaby <jslaby@suse.com>,
 linux-kernel@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>,
 linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

In commit a4912303ac6f ("serial: kgdboc: Allow earlycon initialization
to be deferred") it looks like Daniel really took Linus's new
suggestion about not needing to wrap at 80 columns to heart and he
jammed two full lines of comments into one line.  Either that or he
just somehow accidentally deleted a carriage return when doing final
edits on the patch.  In either case let's make it look prettier.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/tty/serial/kgdboc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index 41396982e9e0..fe6ae98360a2 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -538,7 +538,8 @@ static int __init kgdboc_earlycon_init(char *opt)
 
 	if (!con) {
 		/*
-		 * Both earlycon and kgdboc_earlycon are initialized during			 * early parameter parsing. We cannot guarantee earlycon gets
+		 * Both earlycon and kgdboc_earlycon are initialized during
+		 * early parameter parsing. We cannot guarantee earlycon gets
 		 * in first and, in any case, on ACPI systems earlycon may
 		 * defer its own initialization (usually to somewhere within
 		 * setup_arch() ). To cope with either of these situations
-- 
2.27.0.rc2.251.g90737beb825-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
