Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2067A8B0BE7
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 24 Apr 2024 16:06:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rzdG9-0003D2-Hk
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 24 Apr 2024 14:06:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rzdG6-0003Cr-PW
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 24 Apr 2024 14:06:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jOW6A3oiYgpr232UrDpTzT4iOIowEWVRq6fTiYcPrAY=; b=YeXY8qZocV3e/dwWpKSxzY5DoU
 1edgYkfGVoxX+cAY5gqWTvVssaTGmaetLWVvuaKvgGtm3Ll/V/kKnJXPfzxdII0m0uw8uQhGBrzhf
 OSPXkW8py6vBTT9LtFSoT/WbQtfTIv46MfgEdX12KI1o4qYcJ0MJzZSyTezjFsl0ysXc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date
 :Subject:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jOW6A3oiYgpr232UrDpTzT4iOIowEWVRq6fTiYcPrAY=; b=L
 lLw90TWfvuqTqc+SSlc8NN9A510T/oYr2EA8W7KXP1iwyQyBH/N/+Bfj7fM9PXn1g7Cy+zfweSl00
 /wnxOrFYNuCG3XTfdX9eAMMOSt1vq/qGqvgBbjS2Q9+8GST95myFAAr1p5CZ/ppaMyOT2lccPgZ+N
 VHD8u9Vukoo/LFCc=;
Received: from mail-wm1-f53.google.com ([209.85.128.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rzdG4-0001oN-A9 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 24 Apr 2024 14:06:01 +0000
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-417f5268b12so73844255e9.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 24 Apr 2024 07:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713967549; x=1714572349; darn=lists.sourceforge.net;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jOW6A3oiYgpr232UrDpTzT4iOIowEWVRq6fTiYcPrAY=;
 b=nMF2mwO98p/zHlySASIpEp0u5Vjx+K7s8ydv+1kat5C3p4lQ6w/gMRp4LRCm5oq8O9
 NeW5onkf5oPu3WiLcENqZb5e0a0it+dyD7o4dC9PGm/kAJel5xnMhUcCfZKQ5oeP998a
 IfOI1tFpkp3dNAlriww1Vuo8KjM70+JvSl/C/SMux9uo+NoWaeh7ynxdLJnGFfrQmAGe
 I4FgxTeG77vVCCpxOX+CP2xEbZwmVssjB0BlINhsKm+EanCVg7SD68sHGlgQr7HCYX6d
 RBMrjY08hapYS/Gpm66sdtjuLkn/plEGvg+S8gS+dRrknTnkt2ShTCoxkDEsFmXPHTV1
 UVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713967549; x=1714572349;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jOW6A3oiYgpr232UrDpTzT4iOIowEWVRq6fTiYcPrAY=;
 b=QA4NnJhLdmoBzKG65vw4TCDXwOaUiI7Umk5JuePNJ5lYwh14xlubkg0W/p7QtzBfem
 eWqWgHv3eVhxUuA9hqrgX+BAgJtSu5vzjP3pOzl/GLxnyF065GZOA8iixZpnt64At+QO
 ZWfKN1AmriuTeSGWR970ql+ELnAnJTcpgpRKHA84ZfK9yzaeSIfpeucNBSPEcBbn9e0O
 LXkzgoEKSns/wtzBnN5f9wTuQGSETEw467xoZnKrkTsHzj9dZYuTUmm59f1GDFaqaygr
 ifnxU4430Zk1OC8NOfPTUuP8BiGC23OKYUiL/aDPIVt5XQg7N/NWP4ffYuT5DUYeESWS
 Sf0g==
X-Gm-Message-State: AOJu0YzXhYO3tOvr0IkqGDiG4c6CKaf9u79pZnbkJf1N/Ky2QAyE4mjS
 VZUOmriZVZIAUYmAXrelVWziNTbWfHrR8Oxp1klTCrasO6MBdcQP34RociZVZ5o=
X-Google-Smtp-Source: AGHT+IH5ZR/K91tZ5wMMCx9SFvn1/tZovp+japncGiIcosbRMA1+HnVP0IkzAAq/JNjIKwqR1fh5Jg==
X-Received: by 2002:adf:f852:0:b0:349:92b7:c248 with SMTP id
 d18-20020adff852000000b0034992b7c248mr2527970wrq.29.1713967549288; 
 Wed, 24 Apr 2024 07:05:49 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a5d48c8000000b0034af40b2efdsm9105325wrs.108.2024.04.24.07.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 07:05:48 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Wed, 24 Apr 2024 15:03:33 +0100
Message-Id: <20240424-kgdb_read_refactor-v3-0-f236dbe9828d@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADURKWYC/23N2wrCMAwG4FeRXltp4rqJV76HiLRNthVllVaKM
 vbudgNBYTeBP4cvo0gcPSdx3IwicvbJh6GE/XYjXG+GjqWnkgUqrFQFWt46stfIhkppjXuGKJE
 NUutAk7WiHD7KxL8W9HwpufeprL2XHxnm7per17gMUkkLB4ekQDU1ne5+MDHsQuzE7GX8MRBXD
 SwGk4a2Iah0y3/GNE0fFOAO1fkAAAA=
To: Jason Wessel <jason.wessel@windriver.com>, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2027;
 i=daniel.thompson@linaro.org; h=from:subject:message-id;
 bh=VQpU3J8REVi32pKGrBL39GnkkEpNRc/YcEXuNzhQ7S8=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBmKRFQ+4om7JFZ5/EK9HqNC93TVLDNHWXLVlKqI
 N6SlLkUuAaJAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCZikRUAAKCRB84yVdOfeI
 obpUD/4/S76jZAwd8OokxxtwLhkWuqSLZOblWBwwa1YS/Vr8EogcBxq07lkcO5Qj+XDF6/vrxC+
 H5MjHqmyhShW9raMeZTi6VwYNKh6eFtMa0du4MyTbt9LfDY2EPuePdiZfULwEwhUD14ux1tJlQB
 YIPeK7Vwd10vnJ6bpS8VeONRmHWcrYax864C187IHI4TfoNyFjIi8HttyDIj4oOK43vsYvB5gXG
 ExYEvtVpwCzJRlbV/GaPhSS9wPg2Pthdp/6UhXjGssTv6GWbQbZzCzs0GyMxb/4wHPFyAcAa0Um
 RiMowggoPHC80GsBXfZV6lQchI5l8FtmgC4KFiiZfDSkK6i8slwxYf6ZOdk98pIgHFMaGU1nwM3
 176+voUW/Z4E7vZZJiRbQZlZFeuq3UXQ3PPURa/aJfY+MoYSaQ6KQ0hKDRvUaDxnVJIY9jfM9Bv
 oqHAPtTOPfE1p7ceVWc+MuFgEKPXe9r2HvEhYp9i20HgbImXX0RlmV56ojnfrgzdFpCSmuJmkx4
 +bnti2LiMNhug0bJROEF4iFFRtfIvE95E7qsfNN5lE2h8m994rXZAN7OFrj9A5T14jdzQDwUOTw
 IGf1EPbVO+IFCboN5BHeGnjvL+4vtyWUEkcsFs5r5RywpTOegCKUEtfX7KChIy5fJcfiLsZ0ejN
 gsgmyNOPEKh5zLQ==
X-Developer-Key: i=daniel.thompson@linaro.org; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Inspired by a patch from [Justin][1] I took a closer look
 at kdb_read(). Despite Justin's patch being a (correct) one-line manipulation
 it was a tough patch to review because the surrounding code was hard to read
 and it looked like there were unfixed problems. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.128.53 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.53 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1rzdG4-0001oN-A9
Subject: [Kgdb-bugreport] [PATCH v3 0/7] kdb: Refactor and fix bugs in
 kdb_read()
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

Inspired by a patch from [Justin][1] I took a closer look at kdb_read().

Despite Justin's patch being a (correct) one-line manipulation it was a
tough patch to review because the surrounding code was hard to read and
it looked like there were unfixed problems.

This series isn't enough to make kdb_read() beautiful but it does make
it shorter, easier to reason about and fixes two buffer overflows and a
screen redraw problem!

[1]: https://lore.kernel.org/all/20240403-strncpy-kernel-debug-kdb-kdb_io-c-v1-1-7f78a08e9ff4@google.com/

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
Changes in v3:
- Collected tags from v2
- Added comment to describe the hidden depths of kdb_position_cursor()
  (thanks Doug)
- Fixed a couple of typos in the patch descriptions (thanks Doug)
- Link to v2: https://lore.kernel.org/r/20240422-kgdb_read_refactor-v2-0-ed51f7d145fe@linaro.org

Changes in v2:
- No code changes!
- I belatedly realized that one of the cleanups actually fixed a buffer
  overflow so there are changes to Cc: (to add stable@...) and to one
  of the patch descriptions.
- Link to v1: https://lore.kernel.org/r/20240416-kgdb_read_refactor-v1-0-b18c2d01076d@linaro.org

---
Daniel Thompson (7):
      kdb: Fix buffer overflow during tab-complete
      kdb: Use format-strings rather than '\0' injection in kdb_read()
      kdb: Fix console handling when editing and tab-completing commands
      kdb: Merge identical case statements in kdb_read()
      kdb: Use format-specifiers rather than memset() for padding in kdb_read()
      kdb: Replace double memcpy() with memmove() in kdb_read()
      kdb: Simplify management of tmpbuffer in kdb_read()

 kernel/debug/kdb/kdb_io.c | 153 +++++++++++++++++++++++-----------------------
 1 file changed, 78 insertions(+), 75 deletions(-)
---
base-commit: dccce9b8780618986962ba37c373668bcf426866
change-id: 20240415-kgdb_read_refactor-2ea2dfc15dbb

Best regards,
-- 
Daniel Thompson <daniel.thompson@linaro.org>



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
