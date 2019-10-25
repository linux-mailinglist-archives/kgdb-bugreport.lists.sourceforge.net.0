Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D1EE448B
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 25 Oct 2019 09:34:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iNu6k-000255-4o
	for lists+kgdb-bugreport@lfdr.de; Fri, 25 Oct 2019 07:34:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1iNu6a-000244-Uw
 for kgdb-bugreport@lists.sourceforge.net; Fri, 25 Oct 2019 07:33:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K2G9g70k35Ma4xF7YfZ9Z31DwyEbpBEhJM1jJfvb0Ls=; b=MTe/mF5rouBdz6mjGBJ9NSuutQ
 mb3ATq/BYmqn5TcUusSg/BVV1YSbhxX6dsAs3+F2JxV3Ue2m5Fx98cdus0Gc9egdWR8SBkms2hqIf
 ukP1Hs1uNvxv+aXfUs6ZRBBdrQ01FG1Hi8XUVtpbFYseNeybFREh4Z66Y2ecYd34t2TE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K2G9g70k35Ma4xF7YfZ9Z31DwyEbpBEhJM1jJfvb0Ls=; b=K/cO2qr1baj6TeOECpOqO7Emdt
 HuZxPYNVCTTedgExkS8nQbj7nLbbnsjKC7wDfHlzjFTaZ4etS9c5zcPcuOUXULqUbL2GPlJg57nIP
 hVBnH05PFfzKx5f+J/qM2UUu2G7V+ok1mIS8kceo/ZZqtqtKx2lBDsKiNsG9SGqYokY8=;
Received: from mail-wm1-f42.google.com ([209.85.128.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iNu6Y-00GRxx-3R
 for kgdb-bugreport@lists.sourceforge.net; Fri, 25 Oct 2019 07:33:52 +0000
Received: by mail-wm1-f42.google.com with SMTP id c22so914990wmd.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 25 Oct 2019 00:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K2G9g70k35Ma4xF7YfZ9Z31DwyEbpBEhJM1jJfvb0Ls=;
 b=KZPcyclUjyY3yLuxdwofig+TMKb8hwaV/GkEcAnwSOzk46h9+ITKqyXeyxWpnIrWuX
 nDy7RdqY/pj3FifZQks815NKfP+KPn5CGujJofWfn2eHvm//5FawiG/ZIE0WF4Q6ZMjf
 sdgk8LCX96ssM3eihwYzq8pPN44a05KlVGxI2CSWb1d1qxakYWfvCZNsKuzYn4EVhTsQ
 mNisCKFMW1Nnn9Gw2WZpqru3/5txrIpYVrSwBF09yuJmL6nTE8ixDpPz7n2xANdjYbny
 0ZRIWRinykxgRdKuuceIFRIngP4GJhTxKaVt0AU2PoIu1kKP16DK/0x/qNIJJiAooKh7
 u/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K2G9g70k35Ma4xF7YfZ9Z31DwyEbpBEhJM1jJfvb0Ls=;
 b=h1x4wuWuCgrpeaYZen8c0VOG9pxy3rIK5tq//Ljtj3SRRfF6gK0bsQFrTKKARmcKar
 ua29wxXGC0GqNsuvw26C8mop5eeh2NG04QhryIcqo3cL9s+yA3+IdePjYvWRRuD5tOPD
 ob/AVrzT8bMjdNHvmCIEGCL2jjGkRf2WPNNPunazND9F9wNd5pXZOfNDqYwsrFC/vOK+
 JFZdRSEvtjJnZ6XnK9nGL9MlhEN4YlPge+L1md6yVKjQIYZUTJ/pxpJJz7NiL+Wz1K3t
 rH5vdNwOtL4YuH7XHLdNUef3U9Mtda8NzXrZSahjU00izQeq4dRgFcVGj8Po0Qc0/VXt
 dpxA==
X-Gm-Message-State: APjAAAU/Bb8P8qp2zy4lcT+IzEw2Fr/ZYKhZ1Hc5wVm+wJlNNYXetDr/
 QsAD9iDaTOxhgRjwcl8nhClmM0AV0cWdIg==
X-Google-Smtp-Source: APXvYqyz5HgKF726DT+MGAt4cBrrtuTFCrfsKRMpI2Z6psLGtRU1rTjmt7F4Zu6P/chlp+WcoOAfaw==
X-Received: by 2002:a1c:1d53:: with SMTP id d80mr1047271wmd.88.1571988823439; 
 Fri, 25 Oct 2019 00:33:43 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id a11sm1586602wmh.40.2019.10.25.00.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 00:33:42 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>
Date: Fri, 25 Oct 2019 08:33:24 +0100
Message-Id: <20191025073328.643-2-daniel.thompson@linaro.org>
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
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.42 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.42 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iNu6Y-00GRxx-3R
Subject: [Kgdb-bugreport] [PATCH v4 1/5] kdb: Tidy up code to handle escape
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
 kernel/debug/kdb/kdb_io.c | 128 ++++++++++++++++++++------------------
 1 file changed, 67 insertions(+), 61 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 3a5184eb6977..cfc054fd8097 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -49,6 +49,65 @@ static int kgdb_transition_check(char *buffer)
 	return 0;
 }
 
+/**
+ * kdb_handle_escape() - validity check on an accumulated escape sequence.
+ * @buf:	Accumulated escape characters to be examined. Note that buf
+ *		is not a string, it is an array of characters and need not be
+ *		nil terminated.
+ * @sz:		Number of accumulated escape characters.
+ *
+ * Return: -1 if the escape sequence is unwanted, 0 if it is incomplete,
+ * otherwise it returns a mapped key value to pass to the upper layers.
+ */
+static int kdb_handle_escape(char *buf, size_t sz)
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
@@ -102,68 +161,15 @@ static int kdb_read_get_key(char *buffer, size_t bufsize)
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
+			key = kdb_handle_escape(escape_data, ped - escape_data);
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
