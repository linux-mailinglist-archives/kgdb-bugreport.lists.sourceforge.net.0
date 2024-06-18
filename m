Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A01AC90C0DB
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 18 Jun 2024 03:01:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sJNDc-0008ME-PN
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 18 Jun 2024 01:01:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1sJNDb-0008M7-JW
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 01:01:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jXtDQlH3qupn0qZjK7Kqht//pAWQBswDysjbTh2Fp0I=; b=nFGDeqQU6/4lmr+N85UQubDqIq
 YuHcdbMRoI16LcRnENZeuguFvphIQtyeZ1Y49uxYnSbBMzLIxbA3PhwCIsf5Ipc2e+s/AKaDY9r1f
 1sl/7SZPYUftK/sGP7KUF/cKaTQigI3RwKDxa2Nqbcv8SpZbaCgu2eESuJAfSz1SjCl0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jXtDQlH3qupn0qZjK7Kqht//pAWQBswDysjbTh2Fp0I=; b=ZL9n/ELTHrC9GpAuBMPf1bzs8j
 7z1iFuPyzxufLco1155lLUF5FdZEXeY/vIusu03FpMiCkeiuzA0cckXJNZBiT2jl8XuMfvqHDjApI
 Edd5lvYWbnVmadx/uiXjRNzbBXJwH9K8M+KAre1IVf5Rl2/aUOxdAN7uBVYvAQDgxmg0=;
Received: from mail-qk1-f180.google.com ([209.85.222.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sJNDa-000612-Aj for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 01:01:02 +0000
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-797b24b8944so459266285a.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 17 Jun 2024 18:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718672451; x=1719277251;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jXtDQlH3qupn0qZjK7Kqht//pAWQBswDysjbTh2Fp0I=;
 b=HDhKmbGm2gAYl+YZXCbnxI5+Aoz2JW/okr6u97EQt2TEdalxDAd+f9BYUl1fOKczOx
 p3Hee+KtixFDTPfA0qFP55kXmKTYc/9eAMzWCrfU/TdkOrak/t9Q6s1QueUM+dFq2oyW
 1hZ5CCkDLImhb/iwReVBnPijULBhFxUASqlpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718672451; x=1719277251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jXtDQlH3qupn0qZjK7Kqht//pAWQBswDysjbTh2Fp0I=;
 b=l25kTBFoTx6y4lWEU4n/lD57I9sStua2dLS/PCRqlJeMui0b2zKoUfLDQ/H8prHq1c
 t3PFdvhz1biMfHrImlsxFOmbCnX84z8SOp7PtQ1fVzXZxtqBanG13nM4CyI6akQTZSWZ
 ElJD1fQHgVfZkePMdECZrFd/SFKZ7mre7vGMskcwYDe00X/vGvyIhsD/hQZsQ1Z03Ioj
 HTxQTE9uT7sZ80zyNeJl3dyrrLEiOqQYMcjCgeg7t93oylIjWwbMz40YK9wzJNOCq1GY
 9qrscRD7gEriNZus1H1w3sIqJ36BZwn8Ii0WiPtA+fq51qHmoElJ6K74xiKSgmVH9B6H
 qSXw==
X-Gm-Message-State: AOJu0YyEPWSpy2ObUyXwqlH07FCjsYH1QjYtdKydQbUS7Vtnxbd/Egvh
 BAscXlAKmxJeiJdUuVkBQNoDNgKGxDquXFtO3ZCHM52CAweHmr+kNw3kLf0t6nBkKLMoQ0Vpp30
 =
X-Google-Smtp-Source: AGHT+IH/u84DuulPXx+yw5N5bMm6/HzUFv8lvpttz7Qy/cBPuO4uzd7/a1OmwA0vYyZyQV7iEYNYpg==
X-Received: by 2002:a05:6a20:7288:b0:1b1:c77f:56c3 with SMTP id
 adf61e73a8af0-1bae7e0c23dmr13733218637.7.1718670978386; 
 Mon, 17 Jun 2024 17:36:18 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:1798:e71b:11ad:8b94])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705ccb99f4dsm7905917b3a.216.2024.06.17.17.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 17:36:17 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Date: Mon, 17 Jun 2024 17:34:40 -0700
Message-ID: <20240617173426.6.Ia1d546061f9430a90df0e7521097040e0e939c58@changeid>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
In-Reply-To: <20240618003546.4144638-1-dianders@chromium.org>
References: <20240618003546.4144638-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The "mdW" and "mdWcN" generally lets the user control more
 carefully what word size we display memory in and exactly how many words
 should be displayed. Specifically, "md4" says to display memory w/ 4 [...]
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.222.180 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.222.180 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.180 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.222.180 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sJNDa-000612-Aj
Subject: [Kgdb-bugreport] [PATCH 06/13] kdb: Remove "mdW" and "mdWcN"
 handling of "W" == 0
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

The "mdW" and "mdWcN" generally lets the user control more carefully
what word size we display memory in and exactly how many words should
be displayed. Specifically, "md4" says to display memory w/ 4
bytes-per word and "md4c6" says to display 6 words of memory w/
4-bytes-per word.

The kdb "md" implementation has a special rule for when "W" is 0. In
this case:
* If you run with "W" == 0 and you've never run a kdb "md" command
  this reboot then it will pick 4 bytes-per-word, ignoring the normal
  default from the environment.
* If you run with "W" == 0 and you've run a kdb "md" command this
  reboot then it will pick up the bytes per word of the last command.

As an example:
  [1]kdb> md2 0xffffff80c8e2b280 1
  0xffffff80c8e2b280 0200 0000 0000 0000 e000 8235 0000 0000   ...
  [1]kdb> md0 0xffffff80c8e2b280 1
  0xffffff80c8e2b280 0200 0000 0000 0000 e000 8235 0000 0000   ...
  [1]kdb> md 0xffffff80c8e2b280 1
  0xffffff80c8e2b280 0000000000000200 000000008235e000   ...
  [1]kdb> md0 0xffffff80c8e2b280 1
  0xffffff80c8e2b280 0000000000000200 000000008235e000   ...

This doesn't seem like particularly useful behavior and adds a bunch
of complexity to the arg parsing. Remove it.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 kernel/debug/kdb/kdb_main.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index c013b014a7d3..700b4e355545 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -1611,11 +1611,6 @@ static int kdb_md(int argc, const char **argv)
 
 	if (isdigit(argv[0][2])) {
 		bytesperword = (int)(argv[0][2] - '0');
-		if (bytesperword == 0) {
-			bytesperword = last_bytesperword;
-			if (bytesperword == 0)
-				bytesperword = 4;
-		}
 		last_bytesperword = bytesperword;
 		repeat = mdcount * 16 / bytesperword;
 		if (!argv[0][3])
-- 
2.45.2.627.g7a2c4fd464-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
