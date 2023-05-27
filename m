Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E39E71319A
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 27 May 2023 03:42:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q2ix0-0002DR-Dw
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 27 May 2023 01:42:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q2iwy-0002DB-OH
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 27 May 2023 01:42:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QrSnet5OHiffmIbqSfs7JuxPbvC81vL93khftEXYXiY=; b=LO+q35+hvjG/n2EO/4CB5CYjaB
 0lz07VV53QUL8uBFTdejQo6gqh6wuSS/aCYG4iZtFWi7S3a0YAJ3siqGajXpY0a6U4Aak4MyYzgUY
 KHNnRlKIGkS+2gao3GI5g2WCk0Dq0olkOhq+iAQiC074BUidoch2ZgN3ie7XcINAnRUo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QrSnet5OHiffmIbqSfs7JuxPbvC81vL93khftEXYXiY=; b=A3x7V7RrPDp6swBpZIxPioIniu
 wLnBAn8qRERA3JYJvAROI9zMGc9ZYLlm8Q6Nyni0K7TwMrXZjvb8H3c7vf8dclVatWiHyFpY+GUeB
 lz6Am6LNQkBphNzktbCfjP1pgOAj2P1qDlfBHakZMAMkB5lpoD4fLORoLTedoO7TwzOA=;
Received: from mail-pf1-f181.google.com ([209.85.210.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q2iwx-0002sT-0O for kgdb-bugreport@lists.sourceforge.net;
 Sat, 27 May 2023 01:42:33 +0000
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-64d2a613ec4so1177671b3a.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 26 May 2023 18:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685151745; x=1687743745;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QrSnet5OHiffmIbqSfs7JuxPbvC81vL93khftEXYXiY=;
 b=BT+dRPt9LSQc3DlKLaKCfmyetEhgoJWmpfPImFeN4Zed3b/jcHaHA0DNeF4IWSNxJZ
 pQJPuH6IffGDZ6zcJvw+gKseGPHpDIJ1vf2pyqkdOHxYFk6spwySKVC18nfFTiPC4p1U
 vBzpXfaeufNjvxECgwzvl9XLbFJ2N0kpAe2ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685151745; x=1687743745;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QrSnet5OHiffmIbqSfs7JuxPbvC81vL93khftEXYXiY=;
 b=DIgoZPJo2o7VBC0YyymZc5TjzmiCnPiOIoCvbzGeXsdphBBoWlSZeJZgoko95yjqP4
 n0LJGILV3tMk+4sInY2NEzh/SYw1BKPHiGAMwBOaGcUeFqCGYTGAoFDGEn5rBEjE5ZFE
 JcM0wyVXIjLj3lZbkydrgk5LjLiFDrd5LI7HGh4A7RM/7FuF8Nm3nppnQ1PASMw0FfyQ
 ONLxkEKNEWEArJi0u40tGU9KqlfjT+5lbF1i+HkiB3JR3Bi7HiT1esvJXnrNFWbuyoOt
 EabMirM3/CMEo7mtq3irCUaqTyp5FI1WoZLgToyQZYmJdJvkr6VvVhjNaluHn+xK8ZYe
 Di/w==
X-Gm-Message-State: AC+VfDxwz06A2icgrLkx2BJRni+ZmjktJWwwbfc1EH7aPg/tb+lVBwTS
 j8qfCPmRMqfG4tds7delcD5a2A==
X-Google-Smtp-Source: ACHHUZ40Aya6L3K9wWALtZHzSbN8jGhO+EVfPlmtY3VStdyZv7cwbEJlQWNy+d0vp5EsQiqF5NEtCg==
X-Received: by 2002:a05:6a00:2386:b0:64d:1185:241a with SMTP id
 f6-20020a056a00238600b0064d1185241amr6871168pfc.5.1685151745069; 
 Fri, 26 May 2023 18:42:25 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:4015:7255:c79a:26d7])
 by smtp.gmail.com with ESMTPSA id
 x25-20020aa79199000000b0063b8ddf77f7sm3202440pfa.211.2023.05.26.18.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 18:42:24 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 26 May 2023 18:41:35 -0700
Message-ID: <20230526184139.5.Ia593afc9eb12082d55ea6681dc2c5a89677f20a8@changeid>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
In-Reply-To: <20230527014153.2793931-1-dianders@chromium.org>
References: <20230527014153.2793931-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: In the patch ("watchdog/hardlockup: add comments to
 touch_nmi_watchdog()")
 we adjusted some comments for touch_nmi_watchdog(). The comment about the
 softlockup had a typo and were also felt to be too [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.181 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.181 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q2iwx-0002sT-0O
Subject: [Kgdb-bugreport] [PATCH 05/10] watchdog/hardlockup: remove
 softlockup comment in touch_nmi_watchdog()
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-perf-users@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

In the patch ("watchdog/hardlockup: add comments to
touch_nmi_watchdog()") we adjusted some comments for
touch_nmi_watchdog(). The comment about the softlockup had a typo and
were also felt to be too obvious. Remove it.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 include/linux/nmi.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 3a27169ec383..6c6a5ce77c66 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -140,10 +140,6 @@ static inline void touch_nmi_watchdog(void)
 	 */
 	arch_touch_nmi_watchdog();
 
-	/*
-	 * Touching the hardlock detector implcitily pets the
-	 * softlockup detector too
-	 */
 	touch_softlockup_watchdog();
 }
 
-- 
2.41.0.rc0.172.g3f132b7071-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
