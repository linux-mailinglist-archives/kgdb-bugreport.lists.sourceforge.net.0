Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1EED6669
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 14 Oct 2019 17:46:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iK2Ya-0001H4-CL
	for lists+kgdb-bugreport@lfdr.de; Mon, 14 Oct 2019 15:46:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1iK2YT-0001GN-Vo
 for kgdb-bugreport@lists.sourceforge.net; Mon, 14 Oct 2019 15:46:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jevXkkwcX0tlcqUocBLqbbviGRXh0qF+AVQ/mfDGUjk=; b=NjhMo401CMoGzrwvWF8ffn50jK
 42RJSjhWhoVsyzRa8Ti7EDkIfQk6UGx9Q6hjSiyTnRiysEd2yh94hR2SEEkB/MJFs6S4KV8D1rDEn
 yG4VMLhqV5UYtHqluTgc7QFtVleEJAjCPmGLyIZswh5Aptl+GhZ4C1eBI+IwBwpzZdwg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jevXkkwcX0tlcqUocBLqbbviGRXh0qF+AVQ/mfDGUjk=; b=M8T9WNIF26Y0dTnlCZzodkGnu/
 OFG9UkKs+wvPWIAPSyY/dMyO1+gKgcCt5ORK8gcf/qlhl/hweeE3D7YX6Xauiv6rX7rrAcLjB4k1z
 ZjAewjIQH6YlWZbYg0+WcjvdAXcrwcmPldapzHRV8fXlBKhgzm+u4RJKHZRInoUnM/Lg=;
Received: from mail-wr1-f48.google.com ([209.85.221.48])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iK2YQ-000dH2-2Z
 for kgdb-bugreport@lists.sourceforge.net; Mon, 14 Oct 2019 15:46:41 +0000
Received: by mail-wr1-f48.google.com with SMTP id h4so20339431wrv.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 14 Oct 2019 08:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jevXkkwcX0tlcqUocBLqbbviGRXh0qF+AVQ/mfDGUjk=;
 b=tI5ziScFn2BLsrXBgfvUTIl08iV6sOgpXr5k+1Pj1kKR3aqoRMExitDKDlLxjX2GXl
 G59aID6ez6Ymar1kpnivugXNbl5TecFb49b3Ktws91ZWOqgcmaJNJRwT8ouoxOtqjpb4
 C+kfoMT7NwZ1NtmjvsF/3fk70DsbnkwPM5OLjjh41VCuOc80tl3zbxCpNDgKBZ5SRUFc
 wHgqig4h0/LXG/rprIZbvk/Bddsn5CabXMytCxzESJD9PW9sqHjy4BJSTHqTTMA7mFUn
 pizDZ2FrKM2MSTvISU1Fnq6vbuRj2WcbRrb+TBhldU8aWxhS1vw/piJ7dLP6RDicl3OS
 hzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jevXkkwcX0tlcqUocBLqbbviGRXh0qF+AVQ/mfDGUjk=;
 b=HeVLX9tUEjZCXvtZgFSZwBcFpy3OAN+oDFOYRtieojVUExSipfp5vNOFcGoG1TswMA
 I8CNZzkAHrR/iiZYO9/YmqsIsja6P7UnJsmY2sn02mFQZIWE+OpcE5TfM8G8DVmFHvjD
 7RVcEvJgL6BW5p0XPb632LM8yn842r+Ufo7h2CKgSOU0jevQg43DP9oao7FPBes5kaw9
 L8/na0RBm+5W0RkCvMKkVy84Hb0pELdaqP217Y3FIcvGIg/9PRRbBKNHuL61SULWSUuB
 /dSBlqGntE5M22V2JXMIGwHQtUD+mCLzIRe39Lz2Lb4L3gH/SrJ3X21xBIlQm+0qw1FY
 oIZQ==
X-Gm-Message-State: APjAAAU/bGaxcg/dHRWN350yW32R5aHMydZWw07gdpmUSwnP2JPUvN+w
 zJOfO8csUcCgEwTmpj7HxL8s/Q==
X-Google-Smtp-Source: APXvYqwrhpQluePggjAgvaGAIAcAXqpG1HIcFcJRG+3p3ceuWTCqXStrR4+HdCNFx4yifdG69aY9Wg==
X-Received: by 2002:adf:ed88:: with SMTP id c8mr7828592wro.214.1571067991501; 
 Mon, 14 Oct 2019 08:46:31 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id q22sm16539738wmj.5.2019.10.14.08.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 08:46:30 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Date: Mon, 14 Oct 2019 16:46:22 +0100
Message-Id: <20191014154626.351-2-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191014154626.351-1-daniel.thompson@linaro.org>
References: <20191014154626.351-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.48 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.48 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iK2YQ-000dH2-2Z
Subject: [Kgdb-bugreport] [PATCH v3 1/5] kdb: Tidy up code to handle escape
 sequences
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

kdb_read_get_key() has extremely complex break/continue control flow
managed by state variables and is very hard to review or modify. In
particular the way the escape sequence handling interacts with the
general control flow is hard to follow. Separate out the escape key
handling, without changing the control flow. This makes the main body of
the code easier to review.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 kernel/debug/kdb/kdb_io.c | 127 ++++++++++++++++++++------------------
 1 file changed, 66 insertions(+), 61 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 3a5184eb6977..68e2c29f14f5 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -49,6 +49,63 @@ static int kgdb_transition_check(char *buffer)
 	return 0;
 }
 
+/*
+ * kdb_read_handle_escape
+ *
+ * Run a validity check on an accumulated escape sequence.
+ *
+ * Returns -1 if the escape sequence is unwanted, 0 if it is incomplete,
+ * otherwise it returns a mapped key value to pass to the upper layers.
+ */
+static int kdb_read_handle_escape(char *buf, size_t sz)
+{
+	char *lastkey = buf + sz - 1;
+
+	switch (sz) {
+	case 1:
+		if (*lastkey == '\e')
+			return 0;
+		break;
+
+	case 2: /* \e<something> */
+		if (*lastkey == '[')
+			return 0;
+		break;
+
+	case 3:
+		switch (*lastkey) {
+		case 'A': /* \e[A, up arrow */
+			return 16;
+		case 'B': /* \e[B, down arrow */
+			return 14;
+		case 'C': /* \e[C, right arrow */
+			return 6;
+		case 'D': /* \e[D, left arrow */
+			return 2;
+		case '1': /* \e[<1,3,4>], may be home, del, end */
+		case '3':
+		case '4':
+			return 0;
+		}
+		break;
+
+	case 4:
+		if (*lastkey == '~') {
+			switch (buf[2]) {
+			case '1': /* \e[1~, home */
+				return 1;
+			case '3': /* \e[3~, del */
+				return 4;
+			case '4': /* \e[4~, end */
+				return 5;
+			}
+		}
+		break;
+	}
+
+	return -1;
+}
+
 static int kdb_read_get_key(char *buffer, size_t bufsize)
 {
 #define ESCAPE_UDELAY 1000
@@ -102,68 +159,16 @@ static int kdb_read_get_key(char *buffer, size_t bufsize)
 				escape_delay = 2;
 				continue;
 			}
-			if (ped - escape_data == 1) {
-				/* \e */
-				continue;
-			} else if (ped - escape_data == 2) {
-				/* \e<something> */
-				if (key != '[')
-					escape_delay = 2;
-				continue;
-			} else if (ped - escape_data == 3) {
-				/* \e[<something> */
-				int mapkey = 0;
-				switch (key) {
-				case 'A': /* \e[A, up arrow */
-					mapkey = 16;
-					break;
-				case 'B': /* \e[B, down arrow */
-					mapkey = 14;
-					break;
-				case 'C': /* \e[C, right arrow */
-					mapkey = 6;
-					break;
-				case 'D': /* \e[D, left arrow */
-					mapkey = 2;
-					break;
-				case '1': /* dropthrough */
-				case '3': /* dropthrough */
-				/* \e[<1,3,4>], may be home, del, end */
-				case '4':
-					mapkey = -1;
-					break;
-				}
-				if (mapkey != -1) {
-					if (mapkey > 0) {
-						escape_data[0] = mapkey;
-						escape_data[1] = '\0';
-					}
-					escape_delay = 2;
-				}
-				continue;
-			} else if (ped - escape_data == 4) {
-				/* \e[<1,3,4><something> */
-				int mapkey = 0;
-				if (key == '~') {
-					switch (escape_data[2]) {
-					case '1': /* \e[1~, home */
-						mapkey = 1;
-						break;
-					case '3': /* \e[3~, del */
-						mapkey = 4;
-						break;
-					case '4': /* \e[4~, end */
-						mapkey = 5;
-						break;
-					}
-				}
-				if (mapkey > 0) {
-					escape_data[0] = mapkey;
-					escape_data[1] = '\0';
-				}
-				escape_delay = 2;
-				continue;
+
+			key = kdb_read_handle_escape(escape_data,
+						     ped - escape_data);
+			if (key > 0) {
+				escape_data[0] = key;
+				escape_data[1] = '\0';
 			}
+			if (key)
+				escape_delay = 2;
+			continue;
 		}
 		break;	/* A key to process */
 	}
-- 
2.21.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
