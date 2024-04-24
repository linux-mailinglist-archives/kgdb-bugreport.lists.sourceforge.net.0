Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7728B0BF2
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 24 Apr 2024 16:06:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rzdGO-0007h7-FR
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 24 Apr 2024 14:06:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rzdGE-0007gq-82
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 24 Apr 2024 14:06:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LdQ0ElNNjcpbQIpJ1xf2rchBloiiwlw1canEoGrpfWE=; b=nDImlDjEKD340zGjXcqMA8Hr/l
 ci9IMcd/1iaBHOmKx45B8WtE24hHboxnLSQ4xbUTNPLK+7TN0D9IWqyJYIyTjyi7pTYLvRzPIeCQ9
 l6VqcEtYrQW39mIe2E78n/eDp21Y7AtCYlybsdzVFxrZbmiaMR85IJ+tGxAsMhawugp0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LdQ0ElNNjcpbQIpJ1xf2rchBloiiwlw1canEoGrpfWE=; b=g7laKUMiXJiwnYgcsypeb1XKfv
 IFO3zWU4f9Frj9jbW4KvvcOLOcy3S0vFnK8xtp9Le0Fyl1vjkhFW/GBQ94Vjcxiu+gkYvyXKZh+le
 c7SULtkpsbeHb6ejSUhn4K86F7fG7IcUXTL+bTv8A8xHXsLTYEH43MbslTTIqWBIHex4=;
Received: from mail-wr1-f52.google.com ([209.85.221.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rzdGB-0001oo-Iz for kgdb-bugreport@lists.sourceforge.net;
 Wed, 24 Apr 2024 14:06:10 +0000
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-34a7e47d164so4369312f8f.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 24 Apr 2024 07:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713967556; x=1714572356; darn=lists.sourceforge.net;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LdQ0ElNNjcpbQIpJ1xf2rchBloiiwlw1canEoGrpfWE=;
 b=DWmP+MTJ4BXiQ4P2TjcFLy3NIpUQPy7klIT0CG3kgmJHT5XSSCzv5WE7EgXD2ovCui
 aSU0EYuK3xOWKqmDkzQJajHgUFtsuUWK47QcE9QkU+YUu+KvzTWGWHD+1e+XW9CmfZB1
 R4vaUpxjI9CRuIonn6pprt8X5eKqfVCtVVlqSrXCYRx6YdCoVvWcZDT7KEeyIvEqYx+p
 YC0mCx077jHa0Nqm6ZDxqSZ3cvFtqgrJQV9bqKo5z5zxNt43AgCxjZVloxsQN8s0u+ym
 +/aA6s+VPfBnja4/l+iPbNtIPpyrLITlG2UYZz7QvysblWNC8jY6nSed75Da0GrMpWOR
 6/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713967556; x=1714572356;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LdQ0ElNNjcpbQIpJ1xf2rchBloiiwlw1canEoGrpfWE=;
 b=bsNrEacAEGCcdpNzTdSTbpFQZH+HQ92kuY4ltgb2bkF/meCEXd87tQuw0Y0SwIF6l0
 THdwplAL5+ccBCKQ/UFyOzXEax4HYKxp5Bu1N4Dph503jYh2XlolqgBj8PZIvqNnkKFC
 mLfSTs9D+jmLsGIITzwF5fmhSRl+UrFT7WyiuV+UdjbEkzy9d7qAo+BvydvUENHfNqkD
 M47YKi9Pm8/rMhNjaq9b6ddpixg4w6bKtO1p1NTc0UyZh0SRjXNh9CjPyhPh7rzTTuWS
 Vj0so0xov8ED38Spx/RMudkbNV3b0dW8SPDHEzsCZdEMPXxP6ftpp2dJJ2WzE+rHViRa
 KC4A==
X-Gm-Message-State: AOJu0Ywj1BpTkT6C5Rcn3Dk4lMPeplCY14WKa97P5m2TWozSTICjL89A
 tO0XTu+dkAVPgTQosxiW7BAW3oFD7OBpqA3xVnFhKdCTxJJ68w7ojN1wEI8SMcA=
X-Google-Smtp-Source: AGHT+IEbhdGUtN0Z8RrMf55UUZ1158vNt0de2JPc+rWO8Iun7mc3/roCSNL98rGwj3hJonYnIMLxqA==
X-Received: by 2002:adf:a3c1:0:b0:348:c2c7:efd3 with SMTP id
 m1-20020adfa3c1000000b00348c2c7efd3mr1635594wrb.17.1713967556721; 
 Wed, 24 Apr 2024 07:05:56 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a5d48c8000000b0034af40b2efdsm9105325wrs.108.2024.04.24.07.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 07:05:55 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Wed, 24 Apr 2024 15:03:38 +0100
MIME-Version: 1.0
Message-Id: <20240424-kgdb_read_refactor-v3-5-f236dbe9828d@linaro.org>
References: <20240424-kgdb_read_refactor-v3-0-f236dbe9828d@linaro.org>
In-Reply-To: <20240424-kgdb_read_refactor-v3-0-f236dbe9828d@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1454;
 i=daniel.thompson@linaro.org; h=from:subject:message-id;
 bh=DD7I2+/OSFAuYPjbxmMle8pdnVsY53Td8fq7KEPM4QQ=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBmKRGUcB8O+iLmigr8T2IVW4HGG/L6tk+6pvEd0
 go9Kb3yjbyJAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCZikRlAAKCRB84yVdOfeI
 offTD/9pWj5IWkhuuYbxzyB5xUws8ru2eJBhGkCaw1r+yP62FDECOfAGQUSp7rvl7RoSS5pNTl3
 95INKRg1m8mJP0tcU8Frwd+dGeIac+MbX/u0TlAlMyJNJ5P35RXFaXu1WjKEivlHJxH2AY/aL+o
 mQRdZAq7pr+wHaV1WipO3GlwGO2dcT/iql2hn5AOK4BG521yoFvVQ/xYkAVr/7QHTGRJt1ou8Pf
 PK6TxpAyXzjf4/315QqSCbtWDxb2TGnY9EKG/CerYTij7brpikOAl6VcZZY6PeC8rRTEdb4d6Pt
 ugny7/UdY3HjKVmXiG7QmEIh5m7b/yJXiJUHClRgNkvDXn8rS9xEFqvNmpBlNsNIOllT77q8/Ss
 PIF23Q90NV5bM9dMZf9aC4oMQyQI3Euv3N0Jeic4RQgF0uZ+v6MtckOK2P/LwRMmJwndgvXGOax
 VMfsX8ZNU6tUv9gLQPyBkRq7FZFjQs3jS2Mp1K3X04O5uOZXG5oxwDXfk1/demVrWz50RrLyNIC
 IinhwYB0zXjzoBEU+vFO2nHNev7MfK+hKsGWCZFGRNrhtCgpol3yNCA5QxE01fpHn/QmQ72U3Ki
 ZSpdyepm4L52ZAdmwgg0ju4ByKluyTh6PKBt1GIiS/nI0RoCwtDXgL7LIdoO6P2+rHdojpqCvk9
 prgzSR8mfHkK+2w==
X-Developer-Key: i=daniel.thompson@linaro.org; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.52 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.52 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1rzdGB-0001oo-Iz
Subject: [Kgdb-bugreport] [PATCH v3 5/7] kdb: Use format-specifiers rather
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
 stable@vger.kernel.org, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Currently when the current line should be removed from the display
kdb_read() uses memset() to fill a temporary buffer with spaces.
The problem is not that this could be trivially implemented using a
format string rather than open coding it. The real problem is that
it is possible, on systems with a long kdb_prompt_str, to write past
the end of the tmpbuffer.

Happily, as mentioned above, this can be trivially implemented using a
format string. Make it so!

Cc: stable@vger.kernel.org
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Justin Stitt <justinstitt@google.com>
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/kdb/kdb_io.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index a73779529803f..2aeaf9765b248 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -318,11 +318,9 @@ static char *kdb_read(char *buffer, size_t bufsize)
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
