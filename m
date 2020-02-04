Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F111E15226E
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  4 Feb 2020 23:43:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iz6ub-0005a3-PE
	for lists+kgdb-bugreport@lfdr.de; Tue, 04 Feb 2020 22:43:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1iz6ub-0005Zw-5a
 for kgdb-bugreport@lists.sourceforge.net; Tue, 04 Feb 2020 22:43:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LJphzd4Uf85jJrjWhKW7N0t3rDrhEm6RJEDIyC2Wp+M=; b=dBZDBk54JJP5v2eyd0A8Od92af
 70zrUNrtSfcAeq9Fgy5cZlbOQbKO9UzqDC7ppwfnZ3uzp+sed5gahIga/MSveoy+TwzTqXYX7KeMZ
 YH2wyQOk/eF6Ln9K84IhoXGp3bmEowINVtcX23NNuhFZm+DlaNdqmJYEUlQhcEnwCoOc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LJphzd4Uf85jJrjWhKW7N0t3rDrhEm6RJEDIyC2Wp+M=; b=g
 OrmxbgOZKebxyMkXDUMfd88av8MUApD3va0NpzCmjk2A9nnYg46qWjGECdctIQXE/4P5qkNkpBpfp
 j3oyVS5UA6QmWnzMXk/iu0UkalHRL6D8u23WDc3E2qfZqMHe9ZBvvMwxTdYPeAK6lmaLJWjggtMOf
 hASZ3fLAcJlbcLdI=;
Received: from mail-pg1-f196.google.com ([209.85.215.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iz6uZ-00H8Ez-P2
 for kgdb-bugreport@lists.sourceforge.net; Tue, 04 Feb 2020 22:43:17 +0000
Received: by mail-pg1-f196.google.com with SMTP id j15so3359509pgm.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 04 Feb 2020 14:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LJphzd4Uf85jJrjWhKW7N0t3rDrhEm6RJEDIyC2Wp+M=;
 b=mvX97Tfq4mMzpXUDFwBDvSHaJpQdGdWGprU6RSPFTeqOFWvaP9yMs0ykI/wg4BBnmn
 PoCAX3HBcsnBFzCr4gsesH4ApFy3w+j2kQvW20NSu3FxGvnClvuPCTxQ4T9DuW9QQyka
 4Aumr3CkYWlSSuyWU+MJEH+IAaMQW4yPR5fGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LJphzd4Uf85jJrjWhKW7N0t3rDrhEm6RJEDIyC2Wp+M=;
 b=I/lT1q6aUsPMK/mOnq/26d6nHlm+Kw8DnCDR3CXJxBvdJ5yiY+/qyhXHH1xXQt2phk
 OqLfREmEwJMEXAJxH0eb6HxS4TllK9OChMdD/dzcrgnixsK0KSj41eVzbq5qpfhv4Tg2
 4M8xYIlrDZQ50IfRKSOWAnsfRvqBAD15sSsnwSAj2fM/k1kplhkg67Oy6BUq1PP02sb5
 Oec2PXR4fey858WJ388Cjtjh8m0gvvH5XaBMTcFAW7UVmuWeBnFqmBPsDC/e0eqNI08o
 YT/UC28c9gH6BUthqLc6kg+9u9Ges95Nmcg4jQX3wQLLWfkD7G8zd5B0XdjgnKGAbtU5
 YNCQ==
X-Gm-Message-State: APjAAAUZat3WwXdUjLsZJgjuI1VRysCkUX2xVwjh0wj38gISPT78PVCb
 IJzMLHOtkNN4IkgvQguGRrt5MbYDw7A=
X-Google-Smtp-Source: APXvYqxCQdUqXfhZc+Oe9uYvCKV/DUPxqKgxt4to10QLL9Kq/2IQ/TU+fehc8Lr/r4dYpQ9nDv6Z4w==
X-Received: by 2002:a63:ce03:: with SMTP id y3mr21880478pgf.427.1580854363613; 
 Tue, 04 Feb 2020 14:12:43 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id q21sm25033209pff.105.2020.02.04.14.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 14:12:43 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Daniel Thompson <daniel.thompson@linaro.org>,
 Anatoly Pugachev <matorola@gmail.com>
Date: Tue,  4 Feb 2020 14:12:25 -0800
Message-Id: <20200204141219.1.Ief3f3a7edbbd76165901b14813e90381c290786d@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.196 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.196 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iz6uZ-00H8Ez-P2
Subject: [Kgdb-bugreport] [PATCH] kdb: Fix compiling on architectures w/out
 DBG_MAX_REG_NUM defined
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
Cc: kgdb-bugreport@lists.sourceforge.net, Chuhong Yuan <hslester96@gmail.com>,
 linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jason Wessel <jason.wessel@windriver.com>, sparclinux@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

In commit bbfceba15f8d ("kdb: Get rid of confusing diag msg from "rd"
if current task has no regs") I tried to clean things up by using "if"
instead of "#ifdef".  Turns out we really need "#ifdef" since not all
architectures define some of the structures that the code is referring
to.

Let's switch to #ifdef again, but at least avoid using it inside of
the function.

Fixes: bbfceba15f8d ("kdb: Get rid of confusing diag msg from "rd" if current task has no regs")
Reported-by: Anatoly Pugachev <matorola@gmail.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I don't have a sparc64 compiler but I'm pretty sure this should work.
Testing appreciated.

 kernel/debug/kdb/kdb_main.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index b22292b649c4..c84e61747267 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -1833,6 +1833,16 @@ static int kdb_go(int argc, const char **argv)
 /*
  * kdb_rd - This function implements the 'rd' command.
  */
+
+/* Fallback to Linux showregs() if we don't have DBG_MAX_REG_NUM */
+#if DBG_MAX_REG_NUM <= 0
+static int kdb_rd(int argc, const char **argv)
+{
+	if (!kdb_check_regs())
+		kdb_dumpregs(kdb_current_regs);
+	return 0;
+}
+#else
 static int kdb_rd(int argc, const char **argv)
 {
 	int len = 0;
@@ -1847,12 +1857,6 @@ static int kdb_rd(int argc, const char **argv)
 	if (kdb_check_regs())
 		return 0;
 
-	/* Fallback to Linux showregs() if we don't have DBG_MAX_REG_NUM */
-	if (DBG_MAX_REG_NUM <= 0) {
-		kdb_dumpregs(kdb_current_regs);
-		return 0;
-	}
-
 	for (i = 0; i < DBG_MAX_REG_NUM; i++) {
 		rsize = dbg_reg_def[i].size * 2;
 		if (rsize > 16)
@@ -1896,6 +1900,7 @@ static int kdb_rd(int argc, const char **argv)
 
 	return 0;
 }
+#endif
 
 /*
  * kdb_rm - This function implements the 'rm' (register modify)  command.
-- 
2.25.0.341.g760bfbb309-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
