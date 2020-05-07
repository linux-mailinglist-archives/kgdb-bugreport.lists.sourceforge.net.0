Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C21E31C9EF9
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  8 May 2020 01:12:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jWpgl-0003C2-Jo
	for lists+kgdb-bugreport@lfdr.de; Thu, 07 May 2020 23:12:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jWpgk-0003Bv-1w
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 23:12:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J/3HPQN7W1ZKY/vF6kf3W74SkxKV+nge4or+WiAyuSA=; b=XN1KpYfD6yskoQgSsflSoeZXcX
 TF71+1O/ySYHjoUbseCviucynMBvWZbQOlFiO23nB/m78/Ydodql8KgCZLClib80DyR+4LbLSs7zX
 S8Bx8IJDdJ3Wk1MdfY+dOMfie0PQizuSUDdueju0yqO89pnZ6B7EoyEmr31sm+HyUIsw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=J/3HPQN7W1ZKY/vF6kf3W74SkxKV+nge4or+WiAyuSA=; b=f
 mbqqcqb0u5/D5BNW7+7RqqOhd6HFfKfML0098UbqARZn7pISuZbiTAoQ1t5vtzuGOOD1I2nd3/md5
 DPBxt9Si07YMIyxzNNa+neA4pcu5mgIgoKeqDyF0CJi5UQZCxg70yfT3+hu4SecTDMK5fpsTnqyLX
 6+egU5HnzpjG5Oi8=;
Received: from mail-pf1-f194.google.com ([209.85.210.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jWpgi-00Bmko-PN
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 23:12:22 +0000
Received: by mail-pf1-f194.google.com with SMTP id x2so3776869pfx.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 07 May 2020 16:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J/3HPQN7W1ZKY/vF6kf3W74SkxKV+nge4or+WiAyuSA=;
 b=KDcfxey5JIeGwWZPE5JoJOlaG6N/dElrdB6K50KHlFNelrxKbvTlkPWInDHxs8alm/
 NX3IKCFYgAxWXCG9PdEvu9YXEAfEcE2Nze27cHGAKW5PPMDiXPcZsxWxOItkDTN0ekWq
 LYsQeiFSGwWQ73N+eS/xnETE2JkSx8/6CnM7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J/3HPQN7W1ZKY/vF6kf3W74SkxKV+nge4or+WiAyuSA=;
 b=HlhGu5wVXIVZLCenM2vtV202qJLl6BOtf5Of0twLS91X+Ci8oPotus1gd6yAoVuSjw
 HvBEbZpzLkw0XaQztGSQCoQk7XZ6kkgtDG4yMT2u/Q42pGA1Aa5dRgEMLUvB0kzEe5iy
 TlvzeheFV14box3P6cxBdWdXhI99vBnYUYH+HxkkGQY8ZASIMMglp3C+ZeDmlePnW9Z5
 npfxSRRuM7IoRAtDon1bbOs60NxlnEaW+TpkQz6Eirhxo2P3R74FJODm4mrLzMGQg+Xj
 TtHyKNvdnVLgs5RxDIyLFuQ8aLIcs4xIsO94u25ZkZQFUtwYVUkx5U6P+K1fsxKU8w8n
 DH5g==
X-Gm-Message-State: AGi0PuYwieqygNXAWhWFRHVYiLiQdyTOxnYZNkjvenZCGcYW5fmlQhDF
 6NOqvTDLkDyEiRbWFA6x49e1/Q==
X-Google-Smtp-Source: APiQypIkBJ7SdIhSa8KYeQISr03jagf7wOKIy319ImOEn53vTqQ6U/9cCflFav80DgkHzgPHRdd4JQ==
X-Received: by 2002:a62:ed14:: with SMTP id u20mr16651128pfh.69.1588893134874; 
 Thu, 07 May 2020 16:12:14 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id w12sm5861057pfq.133.2020.05.07.16.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 16:12:14 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>
Date: Thu,  7 May 2020 16:11:46 -0700
Message-Id: <20200507161125.1.I2cce9ac66e141230c3644b8174b6c15d4e769232@changeid>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.194 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.194 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWpgi-00Bmko-PN
Subject: [Kgdb-bugreport] [PATCH] kdb: Cleanup math with
 KDB_CMD_HISTORY_COUNT
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
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From code inspection the math in handle_ctrl_cmd() looks super sketchy
because it subjects -1 from cmdptr and then does a "%
KDB_CMD_HISTORY_COUNT".  It turns out that this code works because
"cmdptr" is unsigned and KDB_CMD_HISTORY_COUNT is a nice power of 2.
Let's make this a little less sketchy.

This patch should be a no-op.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 kernel/debug/kdb/kdb_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 515379cbf209..6865a0f58d38 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -1108,7 +1108,8 @@ static int handle_ctrl_cmd(char *cmd)
 	switch (*cmd) {
 	case CTRL_P:
 		if (cmdptr != cmd_tail)
-			cmdptr = (cmdptr-1) % KDB_CMD_HISTORY_COUNT;
+			cmdptr = (cmdptr + KDB_CMD_HISTORY_COUNT - 1) %
+				 KDB_CMD_HISTORY_COUNT;
 		strscpy(cmd_cur, cmd_hist[cmdptr], CMD_BUFLEN);
 		return 1;
 	case CTRL_N:
-- 
2.26.2.645.ge9eca65c58-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
