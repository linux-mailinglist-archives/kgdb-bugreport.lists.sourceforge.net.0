Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB487A56D
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 30 Jul 2019 12:04:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hsOzB-0000IW-C8
	for lists+kgdb-bugreport@lfdr.de; Tue, 30 Jul 2019 10:04:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hslester96@gmail.com>) id 1hs7Ln-0003qr-IL
 for kgdb-bugreport@lists.sourceforge.net; Mon, 29 Jul 2019 15:14:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7VhBroyGxGn/uVVtotJh4SOBVCoW5vZobk9B4v8Ue9c=; b=Vyz6bXTg6mj+SBNi4qe8WBaP4m
 kbks7yAzmZ3zBp2cPLw2s5rnqk5v9RVOKXnosc8jPlx5LMcRiLu2wknG1a3t0dmaM+2xVXblXMlUP
 T/er8455QyFcF4EX9dw5Dx7/WEU1QW1cbOT7Hur2Us98p3EyWJ0KrKRX6nw7FmxYdrpA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7VhBroyGxGn/uVVtotJh4SOBVCoW5vZobk9B4v8Ue9c=; b=V
 Rfv54zYjBV7UxkKBU4Msde8oJWLsKy65yRyj2ZiRRcFZNNFkgY951CbBI3a5MOvBUmqewS7Spkekd
 y5CQ2YuSS96PxvC/2QcFF0CMFFzanjGoqOg97TB8P/Cs5YmX379/4c9jyqs21zM45oP0LevTaIIaJ
 5J5tQ7peNzG2b2iE=;
Received: from mail-pf1-f193.google.com ([209.85.210.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hs7Ll-003YZH-94
 for kgdb-bugreport@lists.sourceforge.net; Mon, 29 Jul 2019 15:14:11 +0000
Received: by mail-pf1-f193.google.com with SMTP id g2so28200015pfq.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 29 Jul 2019 08:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7VhBroyGxGn/uVVtotJh4SOBVCoW5vZobk9B4v8Ue9c=;
 b=lXJjen3fN3Ee408KHLV8ItbVARbeeRH8QusB5XN/bdyL10ToU0zPjHbw3tviGvtmov
 1+nuJmhnC8aZTaJuHxY8CinSweSTbWgDIBfm9tFwkmciqu3oE358dI5cpLuX6h/Iiwwo
 eMIebB6D0dGyb7ouKfTG+OCtjuJcvsub/TGjZwFGQ8aJJlFgBPGoKfTqSuXoLmEplv2p
 RJcXZz1s2jalkDD4vp2T+ZGURehXZJBl2TIUaxjwSTCimgAiFeii7jIJfiMA9VZKoXRL
 hWJme+SF0QE7L4CYCdA0Ixw9Cq/KdG8qqanqDX0lQnhtyfFcZgmXRF6ZtAolGXao8XD5
 y9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7VhBroyGxGn/uVVtotJh4SOBVCoW5vZobk9B4v8Ue9c=;
 b=R1WARSHrqAfyXyef1J0rIKXzR/siKdqZ8sP+tgksQMblbfT+VnWcdXehfPHRcY+oKs
 tzxvW3ondh9Aw5a2uCncP79yg6bBc7cP5yZRvQWxC25enE2wH478qU4Qbe/c8TGg+Inn
 chANUaQh62aJpKZNc8jdCliu1BoWX7+whvpNjn93PKXIC+5RIgjN1vvO+RZDBXdlarYs
 JpRJVVBLVa7geZtswbmIb3s4t0FM5Gq7qpsSxzw3AjznXlNPB0JSAxkDmNLP6Lf4aeVW
 Cvis2bdHTr9RhIvSUygoIQa5kZzyYBCW1SSMNubw8BR5lwMdjtMjUDqedJwenEV5QGgc
 eY9g==
X-Gm-Message-State: APjAAAU5zR++ITkHSupBTmBeSoMihlc1wGHVNAl95oXUy/sJ+Meg4fgG
 wgRXdkwunc+HRX5UFYoe1BAEDcZ83rQ=
X-Google-Smtp-Source: APXvYqzkKOqzk9ZnxlW7J1CY7+nTn7Zv8asacrJvldoL2+p/rPVCdf0r0PJ9TYacnzPoLzZJvoPeSQ==
X-Received: by 2002:aa7:8817:: with SMTP id c23mr37633718pfo.146.1564413243726; 
 Mon, 29 Jul 2019 08:14:03 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
 by smtp.gmail.com with ESMTPSA id i126sm73927399pfb.32.2019.07.29.08.14.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 08:14:03 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Date: Mon, 29 Jul 2019 23:13:59 +0800
Message-Id: <20190729151359.9334-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (hslester96[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.193 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (hslester96[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hs7Ll-003YZH-94
X-Mailman-Approved-At: Tue, 30 Jul 2019 10:03:59 +0000
Subject: [Kgdb-bugreport] [PATCH 02/12] kdb: Replace strncmp with
 str_has_prefix
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
 Daniel Thompson <daniel.thompson@linaro.org>,
 Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

strncmp(str, const, len) is error-prone.
We had better use newly introduced
str_has_prefix() instead of it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 kernel/debug/kdb/kdb_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 9ecfa37c7fbf..4567fe998c30 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -830,7 +830,7 @@ static void parse_grep(const char *str)
 	cp++;
 	while (isspace(*cp))
 		cp++;
-	if (strncmp(cp, "grep ", 5)) {
+	if (!str_has_prefix(cp, "grep ")) {
 		kdb_printf("invalid 'pipe', see grephelp\n");
 		return;
 	}
-- 
2.20.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
