Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1786F7950
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  5 May 2023 00:46:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1puhiD-0007aY-PZ
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 04 May 2023 22:46:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1puhiD-0007aS-CE
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 May 2023 22:46:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8/SVxTc3UaBCcYMvWm7ggGzatNZYd3WDIFJWHr8ve6I=; b=AV/rbFDI9hnJLCFLQJLg3t9L1I
 KlXXH7RntdjUER8UlLaBip7X2FlWGbV8kHTfHdJ7LzqHujOGnZiimSwked+4Z//BNMxlC+r8oSKqB
 q5gHWfW2aTgReL4shZDK2D8pLEDgBWRwD2JBwyCro5eJwvxEUFzuJbbIqJrwlj2kv14g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8/SVxTc3UaBCcYMvWm7ggGzatNZYd3WDIFJWHr8ve6I=; b=gZEMZIcQvsbyg5qZ1YbHg15Rdn
 IAraBLGWZWMaQTZJUHD/1PwyFmBCJIDom4BsS2UwXYmhMDCrElK5a/48Nr1EGmIvhbYQE0/CEp0UB
 qWIkYPsqOatrBlOwt8+8GXMUCNKF9tbrJbRABpCenu47YJpc5+2qXj8eG/f2urryVkgc=;
Received: from mail-pf1-f174.google.com ([209.85.210.174])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1puhi9-00EXqz-OA for kgdb-bugreport@lists.sourceforge.net;
 Thu, 04 May 2023 22:46:09 +0000
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-643990c5373so790527b3a.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 May 2023 15:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683240360; x=1685832360;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8/SVxTc3UaBCcYMvWm7ggGzatNZYd3WDIFJWHr8ve6I=;
 b=IGnRM2zAzZ5vuqaSwcwJg0QQXMcTL9lVYY2LxemuihNPjJeX4Uueq0/Ed0vYgBqLIY
 k5V+DTkh27/RaQEco0skDkk3rcxjXLxdH80lcg/Ri9B8J3TTPj7QkAG4PTpqzaUuStwU
 yWZBjVqorE7Bd0qvhmb/mrpIXfVvxOrQZmUGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683240360; x=1685832360;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8/SVxTc3UaBCcYMvWm7ggGzatNZYd3WDIFJWHr8ve6I=;
 b=g93LdarvMDyoquqvXYZsCAHEDS25cnCol7LDvXcBgRSN5G7o2gvxw4MOXgPPx2B6xC
 PlfSdRisgjE6G2X206VOdtdEDjq9T193YIRGwZU+NiPiqqrUH/5rVmRw/IQpLrD8L0xl
 iUbXYRuN1MUGemGvqpMKyZ5HU08lR2wep9jpUagVcyAoExKZMlAqGgfSDqJpXXNWpR9P
 lX8SzFLitm7b5bDmCKyZamLOFS7y9lRicQgURxjqWV5DHZgkWJOW7WYJeG5B0ltM5+bi
 wiMxvZ7m+JM6avDJL6OFzTnIWqpKaJ6OeTDztst8Du1JGY8Bg0Ye695R7JPcfHGCWtov
 MaeQ==
X-Gm-Message-State: AC+VfDzwWcOEfxGCMQThn6kr0tM7R2VhE9KNB+BpWTosE39RakusuNUl
 oIvXT+lUe8X0U6LdTZC//5Om2QCKAilbcKlAzIc=
X-Google-Smtp-Source: ACHHUZ6x6UvTHK1Uwv8WFmoIDk5oLTRQJtGFN81A04pmMS/WLo2rYeSvtpIwG+erMPl2na+euS5YjQ==
X-Received: by 2002:a05:6a00:1407:b0:643:59e7:e601 with SMTP id
 l7-20020a056a00140700b0064359e7e601mr4271042pfu.26.1683238489665; 
 Thu, 04 May 2023 15:14:49 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:edf0:7321:6b9e:d5e7])
 by smtp.gmail.com with ESMTPSA id
 g26-20020aa7819a000000b006437c0edf9csm169615pfi.16.2023.05.04.15.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 15:14:49 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  4 May 2023 15:13:34 -0700
Message-ID: <20230504151100.v4.2.I6a729209a1320e0ad212176e250ff945b8f91b2a@changeid>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
In-Reply-To: <20230504221349.1535669-1-dianders@chromium.org>
References: <20230504221349.1535669-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Lecopzer Chen <lecopzer.chen@mediatek.com> No reference
 to WATCHDOG_DEFAULT,
 remove it. Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
 Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com> Reviewed-by: Petr
 Mladek <pmladek@suse.com> Signed-off-by: Douglas Anderson <dianders@chromi
 [...] Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.174 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.174 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puhi9-00EXqz-OA
Subject: [Kgdb-bugreport] [PATCH v4 02/17] watchdog: remove WATCHDOG_DEFAULT
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, Guenter Roeck <groeck@chromium.org>,
 sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 mpe@ellerman.id.au, christophe.leroy@csgroup.eu, Chen-Yu Tsai <wens@csie.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com,
 Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com,
 Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>,
 linux-arm-kernel@lists.infradead.org, ito-yuichi@fujitsu.com,
 linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: Lecopzer Chen <lecopzer.chen@mediatek.com>

No reference to WATCHDOG_DEFAULT, remove it.

Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I yanked this patch from the mailing lists [1] into my series just to
make it easier to avoid conflicts between my series and the one adding
the arm64 perf hardlockup detector, in case someone wanted to test
them both together. This is a nice cleanup and could land together
with the rest of my series if that makes sense.

I changed the patch prefix to match others in my series.

[1] https://lore.kernel.org/r/20220903093415.15850-2-lecopzer.chen@mediatek.com/

Changes in v4:
- Pulled ("remove WATCHDOG_DEFAULT") into my series for v4.

 kernel/watchdog.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 8e61f21e7e33..582d572e1379 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -30,10 +30,8 @@
 static DEFINE_MUTEX(watchdog_mutex);
 
 #if defined(CONFIG_HARDLOCKUP_DETECTOR) || defined(CONFIG_HAVE_NMI_WATCHDOG)
-# define WATCHDOG_DEFAULT	(SOFT_WATCHDOG_ENABLED | NMI_WATCHDOG_ENABLED)
 # define NMI_WATCHDOG_DEFAULT	1
 #else
-# define WATCHDOG_DEFAULT	(SOFT_WATCHDOG_ENABLED)
 # define NMI_WATCHDOG_DEFAULT	0
 #endif
 
-- 
2.40.1.521.gf1e218fcd8-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
