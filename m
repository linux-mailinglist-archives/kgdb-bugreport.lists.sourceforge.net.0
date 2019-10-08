Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 655D6CFB9C
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  8 Oct 2019 15:51:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iHptf-00070U-6o
	for lists+kgdb-bugreport@lfdr.de; Tue, 08 Oct 2019 13:51:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1iHptd-000702-0G
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Oct 2019 13:51:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aow4Ms/uS5HYvl47E6APw8x/hPXJ5HEyt9xExUwySdY=; b=Zt0XDKcNwwfRiTdyhTiGIlED8K
 Rb4NsyW3jkB8iBeqyzdBIS7f1vlKNY1wMufseHFT1xDTnkqQYcC/gdQFNs1LRor6EcjNDz6Fc1YO0
 jBFez+MvNelaS/WQoFLlJXYfDwpkn9HbRPJbQvH2+lI4zI4KO6wV2wj24P+Sh188a2ac=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aow4Ms/uS5HYvl47E6APw8x/hPXJ5HEyt9xExUwySdY=; b=K6E6zG5T1fZ7RoDdbWyhJvOcQa
 q7TCaPIBQsTQT4DwKrXajV0IZpS5vBNIhKZ36jl0025dSlKSAYiHfk7n1l5p9izKnuUz1aGPX7+iA
 /NysxgJinqYlmm3UJ2GTApeBwKa3zSbR09AxRNEGacPWUScOEIs/e5coEsMH3po7NsmM=;
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iHptb-009zFH-Km
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Oct 2019 13:51:24 +0000
Received: by mail-wr1-f67.google.com with SMTP id j18so18714198wrq.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 08 Oct 2019 06:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aow4Ms/uS5HYvl47E6APw8x/hPXJ5HEyt9xExUwySdY=;
 b=wwNfzBdwi+tFi4BAUOyHRxO6sorSM8lVJ0f9OAf/MSR66X2lKs83f5eUB33YApalVX
 DfbAID5zJHC+4shWyp8zC0I5X7YkdXjVNfcPkPirASMdmdzhHb88bim0n/2batTqVJRv
 kYf6f/zuRO1fawEMpXrpt5Vcy9AJeeCIMNkIN6DefjZgQuTONg9Ksi85K/qNK8d1fjOd
 5Odbk25PcC6sEH/YXIndJQ3+1wr1dhQJ1tlKpH6m9Nz4M6cfo9oAL//ZU0WNas+QuqxW
 hxPYxi4BPjP2kqJTiBFgC1KlH/wbh1kGeQ+d+qSLmHkzQLK69ZjQzM/6pWFChJh9YXzs
 a/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aow4Ms/uS5HYvl47E6APw8x/hPXJ5HEyt9xExUwySdY=;
 b=HCpN3UJj0cBw5Mvfrxm69EJmmM4QR69iNktNHzH9XUhXHkCDt4rzzj1kQHhAPa6al1
 ItGiJiDnFDR50pOVPtsgmEwOBv+fN0cmdWDIRcK8yv2rsJtQe+fLhBa4AXsVs+yp1dnX
 /BueJj2FlrB/K+fi0Yv6VqscZ53cRjkfArmnmtdl1WtKooyfcoEnf6heL+zxnUFWaMgr
 /bMwC7XYAqXrg3lt1jTE5tG8Pfxxm/7Z5CyvtCM/DAaXomjJnJH37xklelecjB4Ac+6+
 Y43uf/ALLu77udpSfoi1C2m/3ReerXbh5w50/05RH/YjRy1i79oLWK9WaJhYuGjojzy+
 diHg==
X-Gm-Message-State: APjAAAUSDzEGaWu+zWGAysOqlAq2QtjH0tlXgeoORk773huw+Pk41if6
 RNc6rDqrbV4YK1DHsOMbKcSVxDORNkLSDw==
X-Google-Smtp-Source: APXvYqyS4GHDWXh8kUnxEPgegNjfoS/nOujwEIaubur1wcA3ko8QUV+4bqOePx6mf8a6cIqbdxBmVQ==
X-Received: by 2002:a5d:4c45:: with SMTP id n5mr28870355wrt.100.1570540861496; 
 Tue, 08 Oct 2019 06:21:01 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id t8sm18237214wrx.76.2019.10.08.06.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 06:21:00 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Date: Tue,  8 Oct 2019 14:20:40 +0100
Message-Id: <20191008132043.7966-3-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191008132043.7966-1-daniel.thompson@linaro.org>
References: <20191008132043.7966-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.67 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.67 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iHptb-009zFH-Km
Subject: [Kgdb-bugreport] [PATCH v2 2/5] kdb: Simplify code to fetch
 characters from console
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

Currently kdb_read_get_key() contains complex control flow that, on
close inspection, turns out to be unnecessary. In particular:

1. It is impossible to enter the branch conditioned on (escape_delay == 1)
   except when the loop enters with (escape_delay == 2) allowing us to
   combine the branches.

2. Most of the code conditioned on (escape_delay == 2) simply modifies
   local data and then breaks out of the loop causing the function to
   return escape_data[0].

3. Based on #2 there is not actually any need to ever explicitly set
   escape_delay to 2 because we it is much simpler to directly return
   escape_data[0] instead.

4. escape_data[0] is, for all but one exit path, known to be '\e'.

Simplify the code based on these observations.

There is a subtle (and harmless) change of behaviour resulting from this
simplification: instead of letting the escape timeout after ~1998
milliseconds we now timeout after ~2000 milliseconds

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/kdb/kdb_io.c | 38 ++++++++++++++------------------------
 1 file changed, 14 insertions(+), 24 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 68e2c29f14f5..78cb6e339408 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -122,25 +122,18 @@ static int kdb_read_get_key(char *buffer, size_t bufsize)
 			touch_nmi_watchdog();
 			f = &kdb_poll_funcs[0];
 		}
-		if (escape_delay == 2) {
-			*ped = '\0';
-			ped = escape_data;
-			--escape_delay;
-		}
-		if (escape_delay == 1) {
-			key = *ped++;
-			if (!*ped)
-				--escape_delay;
-			break;
-		}
+
 		key = (*f)();
+
 		if (key == -1) {
 			if (escape_delay) {
 				udelay(ESCAPE_UDELAY);
-				--escape_delay;
+				if (--escape_delay == 0)
+					return '\e';
 			}
 			continue;
 		}
+
 		if (bufsize <= 2) {
 			if (key == '\r')
 				key = '\n';
@@ -148,28 +141,25 @@ static int kdb_read_get_key(char *buffer, size_t bufsize)
 			*buffer = '\0';
 			return -1;
 		}
+
 		if (escape_delay == 0 && key == '\e') {
 			escape_delay = ESCAPE_DELAY;
 			ped = escape_data;
 			f_escape = f;
 		}
 		if (escape_delay) {
-			*ped++ = key;
-			if (f_escape != f) {
-				escape_delay = 2;
-				continue;
-			}
+			if (f_escape != f)
+				return '\e';
 
+			*ped++ = key;
 			key = kdb_read_handle_escape(escape_data,
 						     ped - escape_data);
-			if (key > 0) {
-				escape_data[0] = key;
-				escape_data[1] = '\0';
-			}
-			if (key)
-				escape_delay = 2;
-			continue;
+			if (key < 0)
+				return '\e';
+			if (key == 0)
+				continue;
 		}
+
 		break;	/* A key to process */
 	}
 	return key;
-- 
2.21.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
