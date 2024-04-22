Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 871638AD204
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Apr 2024 18:38:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rywgI-0002XA-1W
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 22 Apr 2024 16:38:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rywgG-0002X0-Pf
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 22 Apr 2024 16:38:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IaPzC1YdTbbmXVhdYLzIcA/Ug78Q+VkMF3OmhCOncvQ=; b=gnluKc6uoqAO4dThoWtN/eMscL
 3QOPZDR0Wqz9J9VNPDRKxezc2sZ2yX9hw4/zUD/PQHl4FBc9din2DAKr9rW5u6253rrS92QD/62SC
 nwJb9tHYwkAI71w7vJl1NlxyecZ3Kb+AlJ7lowbadgKy0ytO1+D/dkcS80aTYz4DSlEI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IaPzC1YdTbbmXVhdYLzIcA/Ug78Q+VkMF3OmhCOncvQ=; b=PMVxb/hoPcRV8Ne9CakbSfM+Gd
 SsHaX8G0vNKO+yMGOSqMt1gCUeaAhMPSfVO8bLELZgmbZsUmqejZ6iiNiZqr3JCRxEBwafNp52ya+
 VAssqSGHKtwcC4+sg3AXjjZivN3z7qP52bROIPZsndpKD4Wv3kIDr7QuHJwDzWbWpp4s=;
Received: from mail-wm1-f44.google.com ([209.85.128.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rywgD-000121-MH for kgdb-bugreport@lists.sourceforge.net;
 Mon, 22 Apr 2024 16:38:10 +0000
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-41a5b68eceeso8173265e9.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Apr 2024 09:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713803879; x=1714408679; darn=lists.sourceforge.net;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IaPzC1YdTbbmXVhdYLzIcA/Ug78Q+VkMF3OmhCOncvQ=;
 b=va7y+WP1gV5F9AAjU+5+5/SC6lO+1htFB0jN+1+7603MLUq24i+J6WmwrNIjTF+BUq
 R7NwI7d2vX06eWxe/lb/kyui6Qd5ydc60s5BrFGRAto+R3uu7Yq6cN1Ri4tZh21NfVvC
 rdUzCK5yQ9zmlN2QZrAgl+waJ1F2COCWzzM0prXFIv4OGxaIhaVGPV3sShUxTKk1va59
 GB8S/BKm2dtVEI1wZCOLBUX+ypWVQmLco6xywygkB7+9NFWuAwSTOjEaysvVJQp2CdKu
 3YZxthkqZOmNJHr9YzfWGbAS5Q+VFuoxUruHqLi2uIFvJpolDitEGWq0RhhdAy4wKfH1
 qQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713803879; x=1714408679;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IaPzC1YdTbbmXVhdYLzIcA/Ug78Q+VkMF3OmhCOncvQ=;
 b=phtDQdV+nH3T0T6YmRFKD/s6feCOMgpRUC73Z4cujHOXPPzDkjnerH9Ws9lD1yfiVb
 mci6O6sO6qpQm7gYNTQw94UHeT8elMvRkd8tI7imiAS6pPwMJhCQ+1epC61CwxQ3enx6
 JL0ETEi3g7qqVFhqGvF0VYMKUZZCH6M8CxF+7XFxQChSsTnfN5MC3AAwX7x9i9yCS5eN
 sGh4iej/AaKAAnjgMHmZlAqrI1zMwowcq6b519hYHDFGwVQ10y6ZfUO6LAGbARSIHjmf
 K/b1jSDYZ9NnZ61HvfOf1j+FntVZvIqZTWDsKk22TAwyDt7z2BnG2pH14EGdzVuATehR
 ocsg==
X-Gm-Message-State: AOJu0Yx79TAd2JPfBJbnjScUG1vybdn7pdhy3bXppUL2SIoBmwqbaQ15
 yGuAVdKIX05Kj+Wiixsq5/EuE238N8QipPnGkaKZHB9R5H1QO3l7e/nBvZkeYR0=
X-Google-Smtp-Source: AGHT+IHIey51AWtx4VQyISLIZOC+vyssMRjF9SgVnb/8KezLsfOHB0E7atrtdgz2hjexSrkqhw1I3w==
X-Received: by 2002:a05:600c:524e:b0:418:fc73:c0d3 with SMTP id
 fc14-20020a05600c524e00b00418fc73c0d3mr7093929wmb.24.1713803878838; 
 Mon, 22 Apr 2024 09:37:58 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 jp13-20020a05600c558d00b0041a9a6a2bebsm433343wmb.1.2024.04.22.09.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 09:37:57 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Mon, 22 Apr 2024 17:35:58 +0100
MIME-Version: 1.0
Message-Id: <20240422-kgdb_read_refactor-v2-5-ed51f7d145fe@linaro.org>
References: <20240422-kgdb_read_refactor-v2-0-ed51f7d145fe@linaro.org>
In-Reply-To: <20240422-kgdb_read_refactor-v2-0-ed51f7d145fe@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1348;
 i=daniel.thompson@linaro.org; h=from:subject:message-id;
 bh=EKbL46mJOaKEQMG7PnN0H6MYhOBkih3jmYcm08ayvmY=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBmJpIzc+qxB+38dGrvf11xB/JwP24/5iyxfzXnR
 7S9uLz9qIaJAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCZiaSMwAKCRB84yVdOfeI
 oaVID/0VfTx+yaeruOa+2ykO35gx+u7NUo2WoPk0OF4mLglbzFwFCAFYEixVj0oZa2Qrvxi/7Zl
 Vg/X68oSztt6j/GiPZ28PTMgUH2F8CBg76ByY3EkKJRk+II13lqZXKldZV9vujuFr77rGBrnFfQ
 BwS3BEv4ne5B1QSbb572bByM6z8ir/cT0bC6b5231gZkxnh51sIEQxt+7ZvbOq33xsAaU4Z6xkK
 83Nrt5ayJuolqgwtyuoFdPJB6u+ybUojj7MNE5Cd+x0zqRDtq4WYDPsbJzIG1ZVAjYDDULJnEom
 lCuxbBcTfbJtqtacC35zqD7XqcqLjtJBpvN/3Zj+I3ZbzsX6X3oSe6EdLm4uusxjKM0HXu+09Yz
 1Gh0TwxPbaMvOrD3cijWo6CtGNXe5xLCnIgn3CvMHq6OpbcoZtQeM/L1Bd3UQnHh7O7mULCai+N
 fO7rrFexjVMwXnPAkeBA9+3pDbe5dITuKEwNSVBCqHhsfm47I0Q+w/5MzmUntEh+mbmFksyNxCy
 34Aouq8LuayIGXynacVyDo1ORQ+YtyNyvwczP3zoTyFZo0pA7SszISNFTbPlzjU8k411CDYrTSW
 abYYUkMtPLM+TpNDxSrc8cb0U1bMVoGbo0PmPdOe8BPY1z6qasGJ6OSesjBergm3AiLEOV1FL+s
 BnSw0TsuHftAgzA==
X-Developer-Key: i=daniel.thompson@linaro.org; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently when the current line should be removed from the
 display kdb_read() uses memset() to fill a temporary buffer with spaces.
 The problem is not that this could be trivially implemented using a [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.44 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1rywgD-000121-MH
Subject: [Kgdb-bugreport] [PATCH v2 5/7] kdb: Use format-specifiers rather
 than memset() for padding in kdb_read()
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
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Currently when the current line should be removed from the display
kdb_read() uses memset() to fill a temporary buffer with spaces.
The problem is not that this could be trivially implemented using a
format string rather than open coding it. The real problem is that
it is possible, on systems with a long kdb_prompt_str, to write pas
the end of the tmpbuffer.

Happily, as mentioned above, this can be trivially implemented using a
format string. Make it so!

Cc: stable@vger.kernel.org
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/kdb/kdb_io.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index f167894b11b8e..2cd17313fe652 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -299,11 +299,9 @@ static char *kdb_read(char *buffer, size_t bufsize)
 		break;
 	case 14: /* Down */
 	case 16: /* Up */
-		memset(tmpbuffer, ' ',
-		       strlen(kdb_prompt_str) + (lastchar-buffer));
-		*(tmpbuffer+strlen(kdb_prompt_str) +
-		  (lastchar-buffer)) = '\0';
-		kdb_printf("\r%s\r", tmpbuffer);
+		kdb_printf("\r%*c\r",
+			   (int)(strlen(kdb_prompt_str) + (lastchar - buffer)),
+			   ' ');
 		*lastchar = (char)key;
 		*(lastchar+1) = '\0';
 		return lastchar;

-- 
2.43.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
