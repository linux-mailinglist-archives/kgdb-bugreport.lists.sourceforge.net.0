Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC12490C0F5
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 18 Jun 2024 03:07:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sJNKB-0007Dy-IA
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 18 Jun 2024 01:07:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1sJNKA-0007Dr-CD
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 01:07:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7YzKFH+D6NQgHG9zhqd66xW8XxeSc0R9a3mp5TZ3Z+A=; b=G496ROyCUcvkJu7Z1aOve7MsmD
 UloT957dru6gTaeB3IszRodOPjMOsQmQkur9VEuO8OkIYtHluqooT0bGyo9ayehjF//tOfOWgNCAE
 6kQkzjr//AuEitTGvabmmDO8QSKm7vU/V91oXRRlGoJS69M3liQK8x5XC6UBwzo4gZwQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7YzKFH+D6NQgHG9zhqd66xW8XxeSc0R9a3mp5TZ3Z+A=; b=cysjvwmffnhAlFqis4U2T6zbJu
 78MCfhbb4jyV2IzKvCHHsC35S/HAEQNuO9LFLF7vSLgmDi6tE8c9qSbs8FXbRr+UWP3dmLirze1rf
 R2m9mFIC1lXz/CSdidtp3bvenjBxRL4W3FnG5n9ruF5OqLkkeJfR0GiVjirHrSZsDLek=;
Received: from mail-yb1-f182.google.com ([209.85.219.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sJNKB-0006I7-Jn for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 01:07:51 +0000
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dfe81d54db9so4644475276.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 17 Jun 2024 18:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718672865; x=1719277665;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7YzKFH+D6NQgHG9zhqd66xW8XxeSc0R9a3mp5TZ3Z+A=;
 b=SEVZeXQxZjHQzbovDStQgUDqgVMcaiAStOG6mZJVi5xwHVV5JsFMixYSohFxoP2NVL
 2+FUH2/6RqTfHV6txRhBvr6IcZDBYaJdAe9ViEFd2E2Uh6XxPQWKbkVqrs6/z0ACZauT
 gVuExuzCeBA4o4m+1g+zHV63xazG5FpeNs2uY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718672865; x=1719277665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7YzKFH+D6NQgHG9zhqd66xW8XxeSc0R9a3mp5TZ3Z+A=;
 b=JVcXunC/X2gTmqbladX3htSlxPv0dYv/ftG/iY5fAa/ZAkrHq5ra/T4PS2ODvx3xFq
 Tv6ocjf9fBUwFcr81NsA8eIDIUQKi8FpETgsfcSv2rqle35w1dEeFESJKPFEDhWoGfk8
 jrfwsyOEZEtfiGkd3sXOOlh8qIpR+bLGi18beJHtNEMOLt/PrLYGjKNxN+qqWTSAQjEH
 Pq00ukmIHaZtNIL/w2wK+xSpfjKg3a3ZVUn+L5u6DXw7gXd1GfaCYJQC4/sMtDS83QiK
 gdZUwQT0RxsLwrKtl3xFCRrsrSeqnbjKAdcwgTJR7QpxY9P87L3kY9alt3t5wvnV8Otp
 boUA==
X-Gm-Message-State: AOJu0Yx8zT1d32AbYqErkhXklg1VKt2FEEYRXPgTjFuXCi94HkFoyDAn
 1m5ux9UzQv/o2rpU1/o/WqZKpEhUlln43mq8Gm0qNzw6yXQqUelTgfLjb7vi7Go5ti/DkEibzOU
 =
X-Google-Smtp-Source: AGHT+IFS3RxVs2fnEd1ihyg8w8up89zEOy8fuhL1k7wY0FKmK/CaH0BVgZ641hCtcwhv6j8bgR00+Q==
X-Received: by 2002:a05:6a20:258c:b0:1b8:2211:b7e6 with SMTP id
 adf61e73a8af0-1bae802a38amr14462075637.49.1718670989991; 
 Mon, 17 Jun 2024 17:36:29 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:1798:e71b:11ad:8b94])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705ccb99f4dsm7905917b3a.216.2024.06.17.17.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 17:36:29 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Date: Mon, 17 Jun 2024 17:34:46 -0700
Message-ID: <20240617173426.12.Ibed4a8f87371710c10b62a6621a5ccf054b2b7c9@changeid>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
In-Reply-To: <20240618003546.4144638-1-dianders@chromium.org>
References: <20240618003546.4144638-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: When specifying a physical address allow specifying the word
 side and the number of words. NOTE: we don't do this for the "mds" command
 since it's pretty much a different beast. Signed-off-by: Douglas Anderson
 <dianders@chromium.org> --- 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.219.182 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.219.182 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.182 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sJNKB-0006I7-Jn
Subject: [Kgdb-bugreport] [PATCH 12/13] kdb: Add mdpW / mdpWcN commands
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

When specifying a physical address allow specifying the word side and
the number of words.

NOTE: we don't do this for the "mds" command since it's pretty much a
different beast.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 kernel/debug/kdb/kdb_main.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 1a37c9bb505c..be72657741a5 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -1653,10 +1653,10 @@ static int kdb_md(int argc, const char **argv)
 
 	if (kdb_md_parse_arg0("md", argv[0], &repeat, &bytesperword))
 		valid = true;
+	else if (kdb_md_parse_arg0("mdp", argv[0], &repeat, &bytesperword))
+		phys = valid = true;
 	else if (strcmp(argv[0], "mds") == 0)
 		valid = true;
-	else if (strcmp(argv[0], "mdp") == 0)
-		phys = valid = true;
 
 	if (!valid)
 		return KDB_NOTFOUND;
@@ -2705,6 +2705,18 @@ static kdbtab_t maintab[] = {
 		.help = "Display RAM given a physical address",
 		.flags = KDB_ENABLE_MEM_READ | KDB_REPEAT_NO_ARGS,
 	},
+	{	.name = "mdpW",
+		.func = kdb_md,
+		.usage = "<paddr> [<lines> [<radix>]]",
+		.help = "Display RAM given a PA using word size (W)",
+		.flags = KDB_ENABLE_MEM_READ | KDB_REPEAT_NO_ARGS,
+	},
+	{	.name = "mdpWcN",
+		.func = kdb_md,
+		.usage = "<paddr> [<lines> [<radix>]]",
+		.help = "Display RAM given a PA using word size (W); show N words",
+		.flags = KDB_ENABLE_MEM_READ | KDB_REPEAT_NO_ARGS,
+	},
 	{	.name = "mdr",
 		.func = kdb_mdr,
 		.usage = "<vaddr> <bytes>",
-- 
2.45.2.627.g7a2c4fd464-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
