Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C658B0BEA
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 24 Apr 2024 16:06:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rzdGD-0004vY-93
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 24 Apr 2024 14:06:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rzdG7-0004vH-Md
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 24 Apr 2024 14:06:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CiQSgCwG9Fjd2pIkvI/eNn2TXAIZ8kV9PyuFCdDbFAA=; b=A1khFPcT3h6NEnTFn1wcVvtXRv
 uNN1CxQvAw+IVPsqtnFBKrYA2VCZGWAV/u5EW1m7Sqo82Xaf6pDLMjiomIOR7i/YdhaChy9ru5fr0
 Dmc5EHjxqaLDRpwIYZVT1NmRguQwnoqm57Pedapt+mGK2DDqS2qaxgIIMJ2y9VJ4y2B0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CiQSgCwG9Fjd2pIkvI/eNn2TXAIZ8kV9PyuFCdDbFAA=; b=dtFHtCGbQr3XwD2Vc8gGFN5OYv
 s6QmtYFMOVLPL/hJ1DRNercR3F6bgdBLoU6jaUBY5jOFB8hTVj5LGnsKDa9r0zIf3HP4gq3e1Nuq0
 oHtLm3RvHwgVlMHanD3xQdWnMcGfjoYRi72UkWUJotLpPFt3cdMOfxI5G3vw1mJol12w=;
Received: from mail-wm1-f41.google.com ([209.85.128.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rzdG3-0001oJ-Hk for kgdb-bugreport@lists.sourceforge.net;
 Wed, 24 Apr 2024 14:06:03 +0000
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-41aa15ae26dso19448835e9.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 24 Apr 2024 07:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713967553; x=1714572353; darn=lists.sourceforge.net;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CiQSgCwG9Fjd2pIkvI/eNn2TXAIZ8kV9PyuFCdDbFAA=;
 b=v6QsklDAvBIYj/vKGMQ/B6HIe2RYtfZTmPsbYvpd48CHPEs8cVENLqfewkyWWPxnwy
 4qmNyxjo61XhAiYLOs3Z3NzCk0sqxQalx41sI6n5IFjRIkEbKDUoY+iNhCXrJkYZ5WVy
 asexU5yq/aw3HrYAA1gR6AE4f/s8lDVCpOhfpeLIKKlx7lbMCLnhwH6dVnBM+vrleMyd
 SRBtqqGrm7JFo/5+bVVMh5Mbljn7WVvAmvmCEcoDNOM2ObvsngvCuJAwMLO5mLeyc+cV
 q+qH0B5O/OfPLxkFJcGM70A0nWLKgymXWneh2LEGyXEwiPqD4TFERniIek0nfzgBr6qG
 3Q9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713967553; x=1714572353;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CiQSgCwG9Fjd2pIkvI/eNn2TXAIZ8kV9PyuFCdDbFAA=;
 b=IOsSEA5hLrHfBq0m23bI75J2Dc2xGSlqFVkbq+V9tecdlfRX99HAXjZ1G1RGoLJQXe
 sR0R5ziYp3Yzuc5v1nMreSwR/nnzv+4uVMNTW5Smh4yDs9ZYrHqWD3RTXU73FqkN361H
 Z9nwh3xEl2DkJEHm6rh2kBjg/Bc/o4DY2izfSYAhahABRKDmEDmIGHkbKjpscDDXTf2K
 lq8aBatE/vDgPZ4taxl8AMPQ+uUsOcNJcZpbFNMZgV0rKN7sdZfToBzuzrIQA4b67g1O
 AdHOVqfeKRW4efS//CjVY9TbZER0z+s8K7N77q2kBiGJ6g5pDosM7oipL8S8FbrJY7CU
 QJ0A==
X-Gm-Message-State: AOJu0Yx0w9cgWcj4PbtkDJAqfojOuNcXuSXz+0HEyroRs2mfiTQR4h2w
 pLrlWHnmUJnLrLUsawUMZGtK/eLav/SB2koH13IWMV3R1elTA00jNSGeNdFSIUg=
X-Google-Smtp-Source: AGHT+IGqG2RVeoMAdeMDYTn9tNZggqfDQ+qae44PwKczUO0hg8teOGcUdrRa+KCXGTu719wfKa2arQ==
X-Received: by 2002:a5d:5449:0:b0:34a:a836:b940 with SMTP id
 w9-20020a5d5449000000b0034aa836b940mr1496105wrv.18.1713967553671; 
 Wed, 24 Apr 2024 07:05:53 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a5d48c8000000b0034af40b2efdsm9105325wrs.108.2024.04.24.07.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 07:05:52 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Wed, 24 Apr 2024 15:03:36 +0100
MIME-Version: 1.0
Message-Id: <20240424-kgdb_read_refactor-v3-3-f236dbe9828d@linaro.org>
References: <20240424-kgdb_read_refactor-v3-0-f236dbe9828d@linaro.org>
In-Reply-To: <20240424-kgdb_read_refactor-v3-0-f236dbe9828d@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1858;
 i=daniel.thompson@linaro.org; h=from:subject:message-id;
 bh=wti5kj6bWe28mBREcjkcFgjgGXuk8vkEPAf7amsQIJY=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBmKRF5rcqN5Dgc+qstFjiPAW9G3hYBgyjtuKx/O
 swzPOkiGi2JAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCZikReQAKCRB84yVdOfeI
 oZjqD/43oGbEO2TFmRq3wSCHWMsq9Im7d0XzuP6Xg6OkzQSMPMsg/HnNUiCk/wDXM00xOeKEbii
 4cU4AETV3oDjp6xBzEveKXrybeWohUWm5Xw4A7NBghLtRIxQZiqPo1K5ZFYwEx9wJ0H5bV9i8V+
 5+40DrU28YsTTricP5jKJzKqTQX+JRuurE8td8GTROh/0HElI0ivzakG7tSJJd5yzM+FFiTJTin
 sVuW+imTw06DPAVR5SlUiBPtWOQ/maUdfNmCf1HDz9iqG35YH58o4ld3cn/4WiC4GAEfEQQZKn6
 uLMK5tZGYB7/AjkgsKuxbpGhUCzv9U2toh+zg9Uk5RcJnDDm/GXuYPOFZiEpVErNH+2JFt8CBJm
 n8l8XydEaaFvPUgXY6/wJZ1R5R4FqOsosP9RRdIZK7g8SGek6RUebPV7T+RE7FA3n7uEbdQwctI
 7K91q6CqDsJaGD1PeCm/vCiLKC9mNv66KCVzCK0FDtUfjLP8zLTGYuYbCoKbqY/BRYY376R17Vz
 SYuypvrzNgSz0GVneF5COWavX9vMDvfIaDaYcjiALtgCIIHM4NKgDSzBZsX52dflKFeUzDBPWy1
 5sb1DLSBpau+aa0r7C0Mb+MBz/JAMUMyVK4PXUP9PAfDSgAD6nHQEfoQbizf/PhzwHm+nkgTsJ5
 fAV1buYnpy4dfLw==
X-Developer-Key: i=daniel.thompson@linaro.org; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently, if the cursor position is not at the end of the
 command buffer and the user uses the Tab-complete functions, then the console
 does not leave the cursor in the correct position. For example consider the
 following buffer with the cursor positioned at the ^: 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.41 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.128.41 listed in list.dnswl.org]
X-Headers-End: 1rzdG3-0001oJ-Hk
Subject: [Kgdb-bugreport] [PATCH v3 3/7] kdb: Fix console handling when
 editing and tab-completing commands
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

Currently, if the cursor position is not at the end of the command buffer
and the user uses the Tab-complete functions, then the console does not
leave the cursor in the correct position.

For example consider the following buffer with the cursor positioned
at the ^:

md kdb_pro 10
          ^

Pressing tab should result in:

md kdb_prompt_str 10
                 ^

However this does not happen. Instead the cursor is placed at the end
(after then 10) and further cursor movement redraws incorrectly. The
same problem exists when we double-Tab but in a different part of the
code.

Fix this by sending a carriage return and then redisplaying the text to
the left of the cursor.

Cc: stable@vger.kernel.org
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Justin Stitt <justinstitt@google.com>
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/kdb/kdb_io.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 50789c99b3ba8..5fccb46f399e5 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -383,6 +383,8 @@ static char *kdb_read(char *buffer, size_t bufsize)
 			kdb_printf("\n");
 			kdb_printf(kdb_prompt_str);
 			kdb_printf("%s", buffer);
+			if (cp != lastchar)
+				kdb_position_cursor(kdb_prompt_str, buffer, cp);
 		} else if (tab != 2 && count > 0) {
 			/* How many new characters do we want from tmpbuffer? */
 			len_tmp = strlen(p_tmp) - len;
@@ -396,6 +398,9 @@ static char *kdb_read(char *buffer, size_t bufsize)
 				kdb_printf("%s", cp);
 				cp += len_tmp;
 				lastchar += len_tmp;
+				if (cp != lastchar)
+					kdb_position_cursor(kdb_prompt_str,
+							    buffer, cp);
 			}
 		}
 		kdb_nextline = 1; /* reset output line number */

-- 
2.43.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
