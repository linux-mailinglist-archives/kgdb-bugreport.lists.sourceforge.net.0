Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DFA8B0BE8
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 24 Apr 2024 16:06:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rzdGA-0007gT-Ox
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 24 Apr 2024 14:06:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rzdG9-0007gJ-IA
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 24 Apr 2024 14:06:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vO2qseMnEiNi51iZjrOv5zkQ/0iFN3HnTr7pOyrnOgs=; b=V+vl/8xoOLyTyw81R4l+LkkN0x
 VV2VnxI0f16LrgxfGqVeseIidskkp6Rq8SmsvlFhsFU+5H/v8HmL9p7MJXnebGAmaOVoxKm/+erw8
 mChCyRc1q2C9ki9NvyzglZ09mz8POPQJY1dSyBWHfYOx6c7nrz8nfp4PP1ZeaFITKB6c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vO2qseMnEiNi51iZjrOv5zkQ/0iFN3HnTr7pOyrnOgs=; b=Oh7IzI8M9HbllnREYrui5NrlhC
 DQWa5NoXPZcdiOnXBgaKfuwNyTEIG2sXij4phfvEMNo2G3/xKUEDotvG77D6GFf2X5eqP0oG0gC+a
 a1VV9nAUaHwihBRnWTRb83lmjQKqY22+hzZkK/QajpuIZCDL8bxPGfPatyVRT+I3myLI=;
Received: from mail-wr1-f51.google.com ([209.85.221.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rzdG4-0001oR-Sn for kgdb-bugreport@lists.sourceforge.net;
 Wed, 24 Apr 2024 14:06:05 +0000
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-343f62d8124so5626136f8f.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 24 Apr 2024 07:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713967550; x=1714572350; darn=lists.sourceforge.net;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vO2qseMnEiNi51iZjrOv5zkQ/0iFN3HnTr7pOyrnOgs=;
 b=rFu3J/CBzPluraAfbm/V5nbvfosXLYFzQ1l8+R5E9a3tBbYXAd/AN41TMTvw284UVS
 lTwzDTckLQ8q5cPaB7P5K9BjcGrylzUGkK+KByZvUivZdiOApIHN8DEItAt/eUCc1/a7
 qMnr1EcA6FlCe5q7bLbemw4YbV9mUiTnOswiH1rE8HSAeF1rPDc4zsLBD9++ZT74+hWG
 dyKmdGnuMRIbR+FwE5Uc7SWKeVwyIS3lwazJ1fcX1yC4SGDBhb7tWoJRnexR1hH57MP1
 NpZsfuZfgcahBlxRE6guBWIRWng2zXZ+bpFjCivFiUBWXzOZN0spLlbIJTGa2PlOo4aN
 Ep7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713967550; x=1714572350;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vO2qseMnEiNi51iZjrOv5zkQ/0iFN3HnTr7pOyrnOgs=;
 b=iyzhob0GqVE9UNoPzOx3Rl9ETpW0MVAtING3rz7ckI2kMaNbj5IjAtK4RTkJyYjOKu
 X4JgS+ejSzQK51r9zqfbWt6nr1QRo4UnGiS9rB/EOQQz97qUpNtCoG1uxEF9PFf4BpYx
 BjkWYo4XWRQsVBTvioWGAjrDdKENnnvXgo/hlQBB+TIpEixbicNi3lSFeL1/TJVgV0dB
 qXyCZsaaH0iu+ZSZyAz1I2sXf4vgn7w4OP9HTIWSLmKb24aKiu2ONbOk9knv2nEuoOG2
 9LAu+2TB2GEVJAkqELqJfpScrMG6g+tS6OR78W7s0QODftrEkfeaJsjlT0yexHphmOF0
 mGAw==
X-Gm-Message-State: AOJu0YxnAl85jefI0Eaj/x7Scu9S0UWguLVDQNx1klytbsnPqvxpV5as
 /KqqOWnrsuJwTCerwFte13Qja1dsiw6gIYQyUXJ8qWE2p6qb5Y848rXEyvlFieI=
X-Google-Smtp-Source: AGHT+IG4FtWF4GLSRqwunMp9Dp7ZmNUSmYCWY3Ci5BIcaqIjosU7J9HsN8aw6mTgzIHb0p4bdhMnoA==
X-Received: by 2002:a5d:408d:0:b0:34b:b0ac:c63c with SMTP id
 o13-20020a5d408d000000b0034bb0acc63cmr1766527wrp.66.1713967549826; 
 Wed, 24 Apr 2024 07:05:49 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a5d48c8000000b0034af40b2efdsm9105325wrs.108.2024.04.24.07.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 07:05:49 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Wed, 24 Apr 2024 15:03:34 +0100
MIME-Version: 1.0
Message-Id: <20240424-kgdb_read_refactor-v3-1-f236dbe9828d@linaro.org>
References: <20240424-kgdb_read_refactor-v3-0-f236dbe9828d@linaro.org>
In-Reply-To: <20240424-kgdb_read_refactor-v3-0-f236dbe9828d@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2263;
 i=daniel.thompson@linaro.org; h=from:subject:message-id;
 bh=pzM2Ee19i9xuwdVm7wtL/DpLvEo5jssFTnFEbmrlKz8=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBmKRFeBl7WDOxk6g2Vz1ghh35u91oebBU7XTmKb
 eGAWsdXcFWJAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCZikRXgAKCRB84yVdOfeI
 odcZD/wNGGoEPbgv3vkcFidVOxzNb+ZDeswc+rrXpA9em1dPd7pWJyJNNjW7V8dH2A8vNlyRzJM
 nHjNW2jzFgd1Kci6i5IXSAY9WtbRlMIzwW05tyCPX7Y90JriEepDE+rnPFV/mgl4OKYlihJ/4w4
 QzrPADJ6x9Q/+WKg1hu9sQBhT9msg1JS1ruCiAMzSG6eU2W8r2eNtKHlBiyDa49Bi6pMip9Igdg
 sblCHRpsLmWF6wO8YZMqToE3jjp/tbjlOykkiuAE2djgVEUHgxLTAmpVYVObwf1AfJZlhEbTgFb
 m14g4bV8FPfvje0AoLb4lwM/s0nngV5d+ddUUn9jUJMi/Xq7xeyW81YO7Cz1cdupY2RVCbHe7vP
 tzzMuN7K3fH7ZOutVmV0Z6ooubU/03li+u7kfFKp6v5BHvA4aG0xB7p0j9k3S80ibxUxMkrLyHV
 qGcQp5fZBnqYnkXqm/xrK8nnoT1FA661h7QTND/hs7EFEwLP8iEQD1+xIr0vxLhOCicvTfCZUlI
 zuVf7WmSFiXv5jHc6OKgxf9CLpQMifkADPqziUDKIVV3yTM8WI868/GEI/zy7TxO32r/5q/pceM
 Es4HFumgKjjajRixUEuTVJoJD1ezkci4ccm5uaQGVLxmmExhSd4Gm6PF0o8V2zQc7x9goo12Dgy
 DNtXUsXfO58HZYw==
X-Developer-Key: i=daniel.thompson@linaro.org; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently, when the user attempts symbol completion with the
 Tab key, kdb will use strncpy() to insert the completed symbol into the command
 buffer. Unfortunately it passes the size of the source buff [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.51 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.51 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1rzdG4-0001oR-Sn
Subject: [Kgdb-bugreport] [PATCH v3 1/7] kdb: Fix buffer overflow during
 tab-complete
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

Currently, when the user attempts symbol completion with the Tab key, kdb
will use strncpy() to insert the completed symbol into the command buffer.
Unfortunately it passes the size of the source buffer rather than the
destination to strncpy() with predictably horrible results. Most obviously
if the command buffer is already full but cp, the cursor position, is in
the middle of the buffer, then we will write past the end of the supplied
buffer.

Fix this by replacing the dubious strncpy() calls with memmove()/memcpy()
calls plus explicit boundary checks to make sure we have enough space
before we start moving characters around.

Reported-by: Justin Stitt <justinstitt@google.com>
Closes: https://lore.kernel.org/all/CAFhGd8qESuuifuHsNjFPR-Va3P80bxrw+LqvC8deA8GziUJLpw@mail.gmail.com/
Cc: stable@vger.kernel.org
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Justin Stitt <justinstitt@google.com>
Tested-by: Justin Stitt <justinstitt@google.com>
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/kdb/kdb_io.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 9443bc63c5a24..06dfbccb10336 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -367,14 +367,19 @@ static char *kdb_read(char *buffer, size_t bufsize)
 			kdb_printf(kdb_prompt_str);
 			kdb_printf("%s", buffer);
 		} else if (tab != 2 && count > 0) {
-			len_tmp = strlen(p_tmp);
-			strncpy(p_tmp+len_tmp, cp, lastchar-cp+1);
-			len_tmp = strlen(p_tmp);
-			strncpy(cp, p_tmp+len, len_tmp-len + 1);
-			len = len_tmp - len;
-			kdb_printf("%s", cp);
-			cp += len;
-			lastchar += len;
+			/* How many new characters do we want from tmpbuffer? */
+			len_tmp = strlen(p_tmp) - len;
+			if (lastchar + len_tmp >= bufend)
+				len_tmp = bufend - lastchar;
+
+			if (len_tmp) {
+				/* + 1 ensures the '\0' is memmove'd */
+				memmove(cp+len_tmp, cp, (lastchar-cp) + 1);
+				memcpy(cp, p_tmp+len, len_tmp);
+				kdb_printf("%s", cp);
+				cp += len_tmp;
+				lastchar += len_tmp;
+			}
 		}
 		kdb_nextline = 1; /* reset output line number */
 		break;

-- 
2.43.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
