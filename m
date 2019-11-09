Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D59CF6138
	for <lists+kgdb-bugreport@lfdr.de>; Sat,  9 Nov 2019 20:45:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iTWg0-0005b6-DF
	for lists+kgdb-bugreport@lfdr.de; Sat, 09 Nov 2019 19:45:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1iTWfz-0005az-OV
 for kgdb-bugreport@lists.sourceforge.net; Sat, 09 Nov 2019 19:45:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TY/VtRKwYYhLwNyDqkkRR3WLEh0rigRGo+K8ilv6++I=; b=U1dvo3cnvrUQEjh6uh4tIpyRab
 ufTY0OJxKpkxKRBL03Jbd5Atq3mBlm5QwEkdrDbAB+RX1d1C457DsQXGqajL3mnLYTjiEhH3WCDuo
 pmponRyRys2CyPpvWnX1oA0fV26Unj2YHryFnlSikhNJZ5FMENsMcS7FfFEwZNR8V8U8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TY/VtRKwYYhLwNyDqkkRR3WLEh0rigRGo+K8ilv6++I=; b=dR/NSDZAKuUDb7fukBpKe7q1QR
 8Jz94pNUSMMYTEQMdKNUlqW83xuhPbY35jvu0BROZUZBgqbCmNpdTQyUJ5U5fnsE+KOl3Ivivs7XM
 a8EpiUKSiKpaWsHDMpvazJsH4ya2S9D+otwP93wVpgogyGKyelgRo4Fdsrdj4s4Kbm70=;
Received: from mail-pf1-f195.google.com ([209.85.210.195])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iTWfw-00C0Zn-7Y
 for kgdb-bugreport@lists.sourceforge.net; Sat, 09 Nov 2019 19:45:39 +0000
Received: by mail-pf1-f195.google.com with SMTP id v19so7434197pfm.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sat, 09 Nov 2019 11:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TY/VtRKwYYhLwNyDqkkRR3WLEh0rigRGo+K8ilv6++I=;
 b=g/eGJl9U1jxbmYciVtsfJlQad5WJ9yjfHBla5ZFyS8bkdypSn6QJNcS+QzONHVDmxz
 c3bkKkAA9KmJyZdaBb/uS1OAnpIVOPuWkOHCwaNST4/PMCibEJWbUj2oec78TJVoaXAh
 ZbYGWvn9nzwcN52NfDz5SD0MvWzK4S78iTyQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TY/VtRKwYYhLwNyDqkkRR3WLEh0rigRGo+K8ilv6++I=;
 b=ZzNhEToeCLvZqIbnNA9j+3t1zo6noUVjvAMkMPwL+rVKhFNb0aVH8xYbv340zsTZsW
 iu1IB4+qe1VqqrlmyXICe+SDbWepO6S1zk8iDgDeta31RxcQNye4RtvlZlrXHOiCh6sy
 E6F1XEVk6yvKH6b/tVYJPUMfCtlzQbebvqZzpwFL2A3UOHeM8QOx5BZ8ce3ooDLSBh/Z
 Ku4hfgTY/6FVAezQHGoQkRhubOasf9du0mVuSfDtANLb9y5aO+ETWXFW5kBvseMX2vap
 nHM2ooEgVyTJ5AF7v0KOE5jtwH9usHR03KgY5jkT65KwNPhRBQ7qoeAqSQNBi04SHt7r
 3/Sg==
X-Gm-Message-State: APjAAAXq17d7zgep52u96D/VCzxU8h78wFjciOr7ECoefCykPNyv4lkP
 +cb8otAfV2zoBXjTZe0AxtYNTw==
X-Google-Smtp-Source: APXvYqwLoettSe3c6USEi+mt/ICgOC1tLDB2bnaxht2vYq9Nq+Ctfo+iismzUSyrS1z789xLf+LMZA==
X-Received: by 2002:a17:90a:ba89:: with SMTP id
 t9mr22462463pjr.138.1573327074178; 
 Sat, 09 Nov 2019 11:17:54 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id i11sm9193577pgd.7.2019.11.09.11.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2019 11:17:53 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Paul Burton <paul.burton@mips.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>
Date: Sat,  9 Nov 2019 11:16:44 -0800
Message-Id: <20191109111624.5.I121f4c6f0c19266200bf6ef003de78841e5bfc3d@changeid>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
In-Reply-To: <20191109191644.191766-1-dianders@chromium.org>
References: <20191109191644.191766-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.195 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.195 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iTWfw-00C0Zn-7Y
Subject: [Kgdb-bugreport] [PATCH 5/5] kdb: Get rid of confusing diag msg
 from "rd" if current task has no regs
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
Cc: qiaochong@loongson.cn, Christophe Leroy <christophe.leroy@c-s.fr>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 kgdb-bugreport@lists.sourceforge.net, Chuhong Yuan <hslester96@gmail.com>,
 ralf@linux-mips.org, linux-kernel@vger.kernel.org,
 Nicholas Mc Guire <hofrat@osadl.org>, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

If you switch to a sleeping task with the "pid" command and then type
"rd", kdb tells you this:

  No current kdb registers.  You may need to select another task
  diag: -17: Invalid register name

The first message makes sense, but not the second.  Fix it by just
returning 0 after commands accessing the current registers finish if
we've already printed the "No current kdb registers" error.

While fixing kdb_rd(), change the function to use "if" rather than
"ifdef".  It cleans the function up a bit and any modern compiler will
have no trouble handling still producing good code.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 kernel/debug/kdb/kdb_main.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index ba12e9f4661e..b22292b649c4 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -543,9 +543,8 @@ int kdbgetaddrarg(int argc, const char **argv, int *nextarg,
 		if (diag)
 			return diag;
 	} else if (symname[0] == '%') {
-		diag = kdb_check_regs();
-		if (diag)
-			return diag;
+		if (kdb_check_regs())
+			return 0;
 		/* Implement register values with % at a later time as it is
 		 * arch optional.
 		 */
@@ -1836,8 +1835,7 @@ static int kdb_go(int argc, const char **argv)
  */
 static int kdb_rd(int argc, const char **argv)
 {
-	int len = kdb_check_regs();
-#if DBG_MAX_REG_NUM > 0
+	int len = 0;
 	int i;
 	char *rname;
 	int rsize;
@@ -1846,8 +1844,14 @@ static int kdb_rd(int argc, const char **argv)
 	u16 reg16;
 	u8 reg8;
 
-	if (len)
-		return len;
+	if (kdb_check_regs())
+		return 0;
+
+	/* Fallback to Linux showregs() if we don't have DBG_MAX_REG_NUM */
+	if (DBG_MAX_REG_NUM <= 0) {
+		kdb_dumpregs(kdb_current_regs);
+		return 0;
+	}
 
 	for (i = 0; i < DBG_MAX_REG_NUM; i++) {
 		rsize = dbg_reg_def[i].size * 2;
@@ -1889,12 +1893,7 @@ static int kdb_rd(int argc, const char **argv)
 		}
 	}
 	kdb_printf("\n");
-#else
-	if (len)
-		return len;
 
-	kdb_dumpregs(kdb_current_regs);
-#endif
 	return 0;
 }
 
@@ -1928,9 +1927,8 @@ static int kdb_rm(int argc, const char **argv)
 	if (diag)
 		return diag;
 
-	diag = kdb_check_regs();
-	if (diag)
-		return diag;
+	if (kdb_check_regs())
+		return 0;
 
 	diag = KDB_BADREG;
 	for (i = 0; i < DBG_MAX_REG_NUM; i++) {
-- 
2.24.0.432.g9d3f5f5b63-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
