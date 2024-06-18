Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A9E90C0A0
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 18 Jun 2024 02:44:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sJMxs-0007bv-JB
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 18 Jun 2024 00:44:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1sJMxr-0007be-0a
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 00:44:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uRVpacVKP8/kEybh72yCSJAMvmAUrPd+O+416uJUqRs=; b=nMFuf+/NVtQwz88SkhC94xKfEy
 x+Sj6rbTH/gB7+4ur4IEhuthr5LtzgO/LFutKgyMpDmXKsRykXvKtf6uKqooKhnF7dQKgAJucvzBy
 Ip4T/MNBaxzVDMd7x55RZy9qoXyxdbD3UFOdDkiQKQcHIPfKhgCqF7EjBMK29l/MesDA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uRVpacVKP8/kEybh72yCSJAMvmAUrPd+O+416uJUqRs=; b=bBj2UWRX/CJ1YKHezOfBUC5il4
 HvDfYoo1DGQ8bTb+ucvnbaQ4U4C9VF325MsbC1GdGvpawRtTKKASTqZ/wI/HNt0WGTrwd5owwTwxR
 ZnTMM8HFjLc7F3KX1gYLn0jFMNLfADCy67AVM8igavjHxQWQkQ+fdfh8HIhx0MKkunes=;
Received: from mail-oi1-f178.google.com ([209.85.167.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sJMxr-00059X-EL for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 00:44:47 +0000
Received: by mail-oi1-f178.google.com with SMTP id
 5614622812f47-3d23db75f5cso2938384b6e.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 17 Jun 2024 17:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718671476; x=1719276276;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uRVpacVKP8/kEybh72yCSJAMvmAUrPd+O+416uJUqRs=;
 b=AuqLGvno+zwNwtEMudkx49/PPoB7gVI5nvzobHkA+HDLeQR6dCGwiAlh2gDk0uD/dz
 WFBK15sBsijoBRaeD0Syww6Xfcq3rDc7F+gFp5U+C/RmU467OYikEoe6CG2A8tGgU683
 whQ9My8wAd7wBEItWpzJJyHHWZX0CczJpwQm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718671476; x=1719276276;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uRVpacVKP8/kEybh72yCSJAMvmAUrPd+O+416uJUqRs=;
 b=todpbgN7tbZOwEGV9QKDgKJloj2BMRBc1bII7WoFadQNEvD1jcINIVWwDhnzYwXX6j
 rXqGHYFsBN3xCmnZEg7IYJ9q9wD/8BQZSDJaCLj4abMLjNxM19ef+CmQdFK+lawHur4n
 hoZBj4gyn6ti5OqIAEcDT7hj5mlqZD48zx68rwHuim7xA0xgHUfShreBg5ncaCMDVedL
 b9DjPHuM6Q7zePUEH0JEoVAx3aRWSmdv0YUpeokMPh+CPVhwwVeGa96wDE3+r4r0v12k
 PXuHfQjZuc3YQrqVHy+xKqXSz647GCwSY/3lpXSPgozkJiRGeq/f8F2C9cauioiUP8iv
 re/A==
X-Gm-Message-State: AOJu0YweZqyG7TrzPuOwH9yB17aUonxliWWgci/WlEX6+gqmYfyNY0km
 QS7m46E0AQd5HUEhiSGFeFkzNDAqk0qtXdPX59tcyilUdJvG2oP60+eFpVfOE3QmpVdMbx0CIt4
 =
X-Google-Smtp-Source: AGHT+IHWXXcRbcfJ1ShLSP+A9Y/8QRIg/zpY9j01+uksHi/wtWTwRM3Xfurp0UfLl17dBlvcoaNdfw==
X-Received: by 2002:a05:6870:a714:b0:250:73d9:7739 with SMTP id
 586e51a60fabf-25842b1e846mr10966179fac.45.1718670986623; 
 Mon, 17 Jun 2024 17:36:26 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:1798:e71b:11ad:8b94])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705ccb99f4dsm7905917b3a.216.2024.06.17.17.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 17:36:25 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Date: Mon, 17 Jun 2024 17:34:44 -0700
Message-ID: <20240617173426.10.I9adfcc6e69e279d7c083b677d9ddfb812a17d665@changeid>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
In-Reply-To: <20240618003546.4144638-1-dianders@chromium.org>
References: <20240618003546.4144638-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The docs say you should use kstrtouint() instead of
 simple_strtoul(), 
 so do so. This nicely simplfies the code a little. Signed-off-by: Douglas
 Anderson <dianders@chromium.org> --- kernel/debug/kdb/kdb_main.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-) 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.167.178 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.167.178 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.167.178 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.178 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sJMxr-00059X-EL
Subject: [Kgdb-bugreport] [PATCH 10/13] kdb: Replease simple_strtoul() with
 kstrtouint() in kdb_md()
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Thorsten Blum <thorsten.blum@toblux.com>, linux-kernel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jason Wessel <jason.wessel@windriver.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The docs say you should use kstrtouint() instead of simple_strtoul(),
so do so. This nicely simplfies the code a little.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 kernel/debug/kdb/kdb_main.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index c064ff093670..6dcbf4ea4bcd 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -1612,11 +1612,8 @@ static int kdb_md(int argc, const char **argv)
 		bytesperword = (int)(argv[0][2] - '0');
 		if (!argv[0][3])
 			valid = true;
-		else if (argv[0][3] == 'c' && argv[0][4]) {
-			char *p;
-			repeat = simple_strtoul(argv[0] + 4, &p, 10);
-			valid = !*p;
-		}
+		else if (argv[0][3] == 'c' && argv[0][4])
+			valid = kstrtouint(argv[0] + 4, 10, &repeat) == 0;
 	} else if (strcmp(argv[0], "md") == 0)
 		valid = true;
 	else if (strcmp(argv[0], "mds") == 0)
-- 
2.45.2.627.g7a2c4fd464-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
