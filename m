Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F55DD666E
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 14 Oct 2019 17:46:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iK2Yc-0004uN-Tb
	for lists+kgdb-bugreport@lfdr.de; Mon, 14 Oct 2019 15:46:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1iK2YW-0004tL-VN
 for kgdb-bugreport@lists.sourceforge.net; Mon, 14 Oct 2019 15:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NXVuAHcqUdvW3hoXUr87/ZG8r6N5TpAF9zjL4wdSLjs=; b=ZwyX1TQ1bUGgiBiTpneTL3Gdqb
 ryHvS2t63yzowztR47imfIsSUgvMi/llxbxnpF7eAVdQg/4drGijMijKhHvQdkJCEqHohjBQYVsmn
 SMpAKSDDeYhgLBaxub2RXJRo46S/bEGt19eeOfwtG+tCwtiZ+bGqSgF9mj9HGAAlq+aY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NXVuAHcqUdvW3hoXUr87/ZG8r6N5TpAF9zjL4wdSLjs=; b=KLP/hMJitBFY6/UpIFBlimIs1U
 Hd17zzFTqBJYb1p62kz/v/0317uVVqjBU40w54FpMQKUpEx/+f0UyXQ6NGTp5+Ny3ehPC2D+5F5Vn
 5q22V/OuE4UFyd6/C3/j3iX3kRW8sxw1LgZPIhYLr/2MH+ARwsEVSXLVHlTwgf5AFZcM=;
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iK2YU-008uFY-CA
 for kgdb-bugreport@lists.sourceforge.net; Mon, 14 Oct 2019 15:46:44 +0000
Received: by mail-wr1-f66.google.com with SMTP id j11so20336852wrp.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 14 Oct 2019 08:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NXVuAHcqUdvW3hoXUr87/ZG8r6N5TpAF9zjL4wdSLjs=;
 b=z0fLFZdiPdt8jFM79h6y29ec5MdAp59EkR64ijJkc1qehMaqn2x6FJkeo/NnmuHEHk
 j0o5v8iPg0+KK7JLooF72uFuacfEAcb5FywnYGz7gOgd/bdQjzM6xIdbn517084et/Xp
 Bq9Xot8YchrJLHTDzrMGZvXI0Q7d5flJhYIIQifqmAN2SKlNNbYDtyYTLoM83wZjUy9M
 HMEivEnl+VO0Sw0i7PmvinffXtQ6t0u+p+lPg5N9W6YSlxKWX/msc+74g9VSRDOp6Jra
 Ei0/RMsmyksc/XTq8VdmV1LYgxKtE8T6SUbWEuQ1FrPqweF1N6srFJdGMEz+FfxIRraP
 31PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NXVuAHcqUdvW3hoXUr87/ZG8r6N5TpAF9zjL4wdSLjs=;
 b=FWj45bCW9LNZ/H9QOttag1xy6ZYVI6N2XzFv5OZd+9/qkadvPTayqdqD66HVm/UHH/
 5DU/iHeuIVwYH0q/3bCa2JROzEyme9g0ROt5u6Mt+vmzM4tTnMIOoPJBoqNYcH6vbmLF
 kmn49nMUT4LuxRZamSqkM8QHG9GUlsmpwLNRMdPxYx8cWVDEX5WGt8S91ZoVhB2+64BK
 OZ6B2v7m8ynMK3zvviyl9MiHP+TonYIXm7RWETHbxad9T865tU7qUjd9QZRaCYYkdoZH
 1pcmQvQ81Jpedk1Kq5aYFHPflOxFIIM12DxloWGLluoFOVGDbetF+pEbeua1LTwK3Mvf
 ygNA==
X-Gm-Message-State: APjAAAVbObsafykC7/iJPECCzvMYvxvlbYjnPyDhxlfRRLce62eYJ3Gu
 gVKJNMtFiBvDUgovk9tfui04sQ==
X-Google-Smtp-Source: APXvYqx5FADHfzYt8ud++1U/l8HJVf0n/fufR09PMBReCszMIQDI28Ic5gABp6oUYxd229QF8PVDnQ==
X-Received: by 2002:adf:fa12:: with SMTP id m18mr26744805wrr.248.1571067995742; 
 Mon, 14 Oct 2019 08:46:35 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id q22sm16539738wmj.5.2019.10.14.08.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 08:46:34 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Date: Mon, 14 Oct 2019 16:46:25 +0100
Message-Id: <20191014154626.351-5-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191014154626.351-1-daniel.thompson@linaro.org>
References: <20191014154626.351-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.66 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.66 listed in list.dnswl.org]
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iK2YU-008uFY-CA
Subject: [Kgdb-bugreport] [PATCH v3 4/5] kdb: Improve handling of characters
 from different input sources
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
 Daniel Thompson <daniel.thompson@linaro.org>, linux-kernel@vger.kernel.org,
 patches@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Currently if an escape timer is interrupted by a character from a
different input source then the new character is discarded and the
function returns '\e' (which will be discarded by the level above).
It is hard to see why this would ever be the desired behaviour.
Fix this to return the new character rather than the '\e'.

This is a bigger refactor than might be expected because the new
character needs to go through escape sequence detection.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/kdb/kdb_io.c | 39 +++++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 39476616295e..f9839566c7d6 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -125,10 +125,10 @@ char kdb_getchar(void)
 {
 #define ESCAPE_UDELAY 1000
 #define ESCAPE_DELAY (2*1000000/ESCAPE_UDELAY) /* 2 seconds worth of udelays */
-	char escape_data[5];	/* longest vt100 escape sequence is 4 bytes */
-	char *ped = escape_data;
+	char buf[4];	/* longest vt100 escape sequence is 4 bytes */
+	char *pbuf = buf;
 	int escape_delay = 0;
-	get_char_func *f, *f_escape = NULL;
+	get_char_func *f, *f_prev = NULL;
 	int key;
 
 	for (f = &kdb_poll_funcs[0]; ; ++f) {
@@ -148,27 +148,26 @@ char kdb_getchar(void)
 			continue;
 		}
 
-		if (escape_delay == 0 && key == '\e') {
+		/*
+		 * When the first character is received (or we get a change
+		 * input source) we set ourselves up to handle an escape
+		 * sequences (just in case).
+		 */
+		if (f_prev != f) {
+			f_prev = f;
+			pbuf = buf;
 			escape_delay = ESCAPE_DELAY;
-			ped = escape_data;
-			f_escape = f;
-		}
-		if (escape_delay) {
-			if (f_escape != f)
-				return '\e';
-
-			*ped++ = key;
-			key = kdb_handle_escape(escape_data,
-						     ped - escape_data);
-			if (key < 0)
-				return '\e';
-			if (key == 0)
-				continue;
 		}
 
-		break;	/* A key to process */
+		*pbuf++ = key;
+		key = kdb_handle_escape(buf, pbuf - buf);
+		if (key < 0) /* no escape sequence; return first character */
+			return buf[0];
+		if (key > 0)
+			return key;
 	}
-	return key;
+
+	unreachable();
 }
 
 /*
-- 
2.21.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
