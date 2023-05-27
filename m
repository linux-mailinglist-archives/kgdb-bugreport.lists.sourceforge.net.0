Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CEF7131A1
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 27 May 2023 03:42:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q2ixF-0004OC-7o
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 27 May 2023 01:42:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q2ix5-0004O5-VO
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 27 May 2023 01:42:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hhZKQ5chvzZjdXAK7yuxvuaTNwo4ZylkC6Gy3ujvEec=; b=QVMEgTwyZ5K/neUVTTr5gcE1Wo
 MSbJ3R9ir5lQxKYm0Rl5blW89LStLWLt7kcIEOT6fol34FPgxfxYSHGwDLMOMGym0XkCu578Q3V/Z
 1sTY0bNV6U7Gd3Zq7rzGcpEgH6UV2fXdwTRA04/46JJURauiTccGbmq3GRLiOcf6EWhw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hhZKQ5chvzZjdXAK7yuxvuaTNwo4ZylkC6Gy3ujvEec=; b=EKIddq6q1EC6UnXE+uWpJoXvqR
 UKHuzHufHbrqcR2TU55cw7dwky7MgKTX3dCrr82fmF4c1yDuvnGpzU3XOx6lA0+qxgvkqznXfy/71
 RFQQ9dAtEEIq9vow+m7Os8b/NcM/xeYTSLVeXZ8GPAUq2yiR3IiQZttbLaM5aNjLZ6FU=;
Received: from mail-pf1-f178.google.com ([209.85.210.178])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q2ix1-003o37-Uu for kgdb-bugreport@lists.sourceforge.net;
 Sat, 27 May 2023 01:42:39 +0000
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-64d1a0d640cso1223325b3a.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 26 May 2023 18:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685151750; x=1687743750;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hhZKQ5chvzZjdXAK7yuxvuaTNwo4ZylkC6Gy3ujvEec=;
 b=Aa2FnlO7cA7GOt4jdHYmDdd1WDaYmdWhcVEaBF5A+6UaJVFXdOsQgbvTyfqoPjk4bh
 xDmNcaix5P9IJQEn4sRdp17S3cm+b5XkOk0LLoDg2dgEdaX2+JASBn14gthkz9JJvjeq
 /e8LlbDE1Czum9F+Yjho76XQANK+Ly3h8sjUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685151750; x=1687743750;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hhZKQ5chvzZjdXAK7yuxvuaTNwo4ZylkC6Gy3ujvEec=;
 b=V6P8dwCWh8+CzWwFcqfZijl+QmZ5qTbOUXhjvLjsc4lfQcci4fw+yzspHu4Op+4aoM
 GERB9NbP20QucsxM1bY+r0vJTYsBeK0s//0TE5hd+kREkSk2zCc4ZOhRuazwQILprcb1
 M8v/ptXWR+JKpraKb/SH59kCCCxZFwTYu8prCaAgyOd00hxKxy7RWlaF6tLDJtN3MkdS
 pVmEJ5i25dbcmFcimmcpbEgQ/2v9nYme2f8L/N8L4iOrpd81lIhc8mGADeEnKFOYRD+R
 ZzBABGAPQrWSdKXAQc+YiZoyvyt2H3q06QfFoYlpeMVcGwzX0QwqgPxUd8FkHCuvPxMt
 hwWw==
X-Gm-Message-State: AC+VfDwnxjnynU0hdwMH6Gh5TwDO8QB3tg0UrWCbgeyn6/75wYI0hTCs
 Z73mohKcTfaRnXAijDQoRNh34w==
X-Google-Smtp-Source: ACHHUZ76rNf6n7Cx97qFMKMnLQrSEH7QLJeo9anNJyrNS+vARlA10YQ6Hwp4TAKjsYTO1yI+mRUWlQ==
X-Received: by 2002:a05:6a00:3911:b0:63d:2f13:200 with SMTP id
 fh17-20020a056a00391100b0063d2f130200mr6100546pfb.16.1685151750426; 
 Fri, 26 May 2023 18:42:30 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:4015:7255:c79a:26d7])
 by smtp.gmail.com with ESMTPSA id
 x25-20020aa79199000000b0063b8ddf77f7sm3202440pfa.211.2023.05.26.18.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 18:42:29 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 26 May 2023 18:41:38 -0700
Message-ID: <20230526184139.8.I49d5b483336b65b8acb1e5066548a05260caf809@changeid>
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
 Content preview: The dependency for HARDLOCKUP_DETECTOR_PREFER_BUDDY was more
 complicated than it needed to be. If the "perf" detector is available and
 we have SMP then we have a choice, so enable the config based on [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.178 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.178 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q2ix1-003o37-Uu
Subject: [Kgdb-bugreport] [PATCH 08/10] watchdog/buddy: Simplify the
 dependency for HARDLOCKUP_DETECTOR_PREFER_BUDDY
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

The dependency for HARDLOCKUP_DETECTOR_PREFER_BUDDY was more
complicated than it needed to be. If the "perf" detector is available
and we have SMP then we have a choice, so enable the config based on
just those two config items.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 lib/Kconfig.debug | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index c9df93402237..eb1edd5905bc 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1065,7 +1065,7 @@ config HAVE_HARDLOCKUP_DETECTOR_NON_ARCH
 
 config HARDLOCKUP_DETECTOR_PREFER_BUDDY
 	bool "Prefer the buddy CPU hardlockup detector"
-	depends on HAVE_HARDLOCKUP_DETECTOR_NON_ARCH && HAVE_HARDLOCKUP_DETECTOR_PERF && SMP
+	depends on HAVE_HARDLOCKUP_DETECTOR_PERF && SMP
 	help
 	  Say Y here to prefer the buddy hardlockup detector over the perf one.
 
-- 
2.41.0.rc0.172.g3f132b7071-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
