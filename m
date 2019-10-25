Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E45E448D
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 25 Oct 2019 09:34:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iNu6l-0002LE-S4
	for lists+kgdb-bugreport@lfdr.de; Fri, 25 Oct 2019 07:34:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1iNu6d-0002Jg-2a
 for kgdb-bugreport@lists.sourceforge.net; Fri, 25 Oct 2019 07:33:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VxRxdqK8wDgtRtqhN/4fmGim8qsHy1Sh2vs1pQm0S1s=; b=D6xPg+mTzjezLmFMQUQQJYNc4B
 1GUYHr10lTiidFuO77mGIpGcfNaa3yRy924Jbl1ELU4G9xcaBqpikyH6QyOXqJdgbOdH+jqRxqQw0
 7MKfnqec98kLE//kUWdfpnE9x4X9jMbr2/tHdhGdMGx5Cp62juek5chw1MynMHuuxPbE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VxRxdqK8wDgtRtqhN/4fmGim8qsHy1Sh2vs1pQm0S1s=; b=XSJ2ovhLgRfPfwqlndbYNMxlhz
 Sikki3w6Ni9O7LepMVHodNnotHO3WwGOjpy6x/wq/H1lpFx4PV2Nd06R2j7y8uu7H3LnFHqdLL1oh
 LrxB4uDEfXsJ1jSpHb8L6sRCqFJBhqRqgtXyLhoRNL6Ss0YmgFgeb5cSQFMt8vPJ5a6I=;
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iNu6b-00GRy2-VA
 for kgdb-bugreport@lists.sourceforge.net; Fri, 25 Oct 2019 07:33:55 +0000
Received: by mail-wr1-f68.google.com with SMTP id q13so1050919wrs.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 25 Oct 2019 00:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VxRxdqK8wDgtRtqhN/4fmGim8qsHy1Sh2vs1pQm0S1s=;
 b=F5JEpHMej8YX8/tXiqp25sBGpi1nHuIwrK/ACEWIlTPQozJML/KptQdG5HGN4mB0mN
 Dmj9dtiWrZYX+yR4JK3i5Lrw7hKeW+ZMJhTepWlCKmhVeVGbDNAPXVaKRs49ut5Lchs0
 pGD2ZDoyvmprP9o6AMdzq9FkIlo5jzFVLmfO6O0XiN/zFuzIo43Ms3rH2k8+GWNv37wk
 Aq9mXXxRAIzdsuXmoGscnLJrlSDOetxBr+G4c3kWFlddhFxWqp7ShmIBashpCE7vlqNI
 JqRXHfCVpcFEjLwlJbT8XxvWOLUMeeWwrzIKjnAHNEPWE1XG74iy+9G1Ok8qTXMOQYad
 KaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VxRxdqK8wDgtRtqhN/4fmGim8qsHy1Sh2vs1pQm0S1s=;
 b=bgFEBgM9RAQ3c0Rf2O0nIq7CrLJCkqd64tMAfba9ppTuX1e66Jfmw3uTvRlaYx9BHt
 B/BgitEmZtaNeCA3NulRng+XNXoQEVR5WHpM9t46lvqtfJtIpsQ0mbNG7gFIS4FAP1RH
 LSLAuiNSfQAtA97Dckf7WFEc8+uoZuq0A5UB8JffPIDt73FVVyr2OVypGTnh+CTQ3bUG
 afzMp+osF2Ar7L0JYSMODIvpM9zxqN497krE0ct5P5qlZuGmjJW9Z8oRvNKzH3fm887X
 gf0c7DcyGOEfnAPXA0V90HpiJ8pBAKtuazRYAn6WzhKMNl7pIvtv0LyLUCniixn1DFH5
 2jDQ==
X-Gm-Message-State: APjAAAUv6wc6LGA45d2aK4qALT/rJXU8Ah/R1q3PqYZ0DGqkTqpdox0b
 qiRMi7otgkIqir1qsQhGqoMjCLNcOpiY2A==
X-Google-Smtp-Source: APXvYqwDI5MATscItj7Zxy/MypGFHIa/wSL6G9jo3i0hphS69xVNL/iB2urgVUDMDDWBUq8S5GQmGQ==
X-Received: by 2002:a05:6000:118f:: with SMTP id
 g15mr1440429wrx.242.1571988827402; 
 Fri, 25 Oct 2019 00:33:47 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id a11sm1586602wmh.40.2019.10.25.00.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 00:33:46 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>
Date: Fri, 25 Oct 2019 08:33:27 +0100
Message-Id: <20191025073328.643-5-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025073328.643-1-daniel.thompson@linaro.org>
References: <20191025073328.643-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.68 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.68 listed in wl.mailspike.net]
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iNu6b-00GRy2-VA
Subject: [Kgdb-bugreport] [PATCH v4 4/5] kdb: Improve handling of characters
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
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 kernel/debug/kdb/kdb_io.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 9b6933d585b5..f794c0ca4557 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -127,10 +127,10 @@ char kdb_getchar(void)
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
@@ -150,26 +150,26 @@ char kdb_getchar(void)
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
-			key = kdb_handle_escape(escape_data, ped - escape_data);
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
