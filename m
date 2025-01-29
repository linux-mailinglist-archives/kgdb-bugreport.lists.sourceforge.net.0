Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 97672A222CE
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 29 Jan 2025 18:24:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tdBnQ-0007Ni-7a
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 29 Jan 2025 17:24:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1tdBnK-0007Nc-Gv
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 29 Jan 2025 17:24:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6AqjmiYQ2r2JxBlknz3mDpl7pUK+MR/UX2y/MOk5lqw=; b=Syafoj8tWn+0P9YUnCM3Fjhaxp
 Jt3XG6k8rc3lxguLo4aso3Ig03HvNFCjfsbYiJLI9d2QVjf/YUEzI0l6gUSWhGu2RqjL5t/37LQy/
 S5JhOD9zND0CQyawWmPyBJEWrLUKvk4IiEQNhrpDOSNRyhKO/fisb5jWWql6lVGuhG1k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6AqjmiYQ2r2JxBlknz3mDpl7pUK+MR/UX2y/MOk5lqw=; b=h
 Uv3Xv+U57puuAU0pLzm5JEgp5lvoLz6h21Ul/bD8WmuCyksvk12KNuhDeVeH5kdMsd8xFhvA5ouj3
 v2gUqmQIhHMRsy1nR5lxNgjzf+S5E4zNhxUhBOUIvjrtrRx8nZ9TzGVMgm+Rhow4CTT8d6wtldSzs
 aK/ELppMIi7SsM+k=;
Received: from mail-qk1-f171.google.com ([209.85.222.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tdBnJ-0005xT-LZ for kgdb-bugreport@lists.sourceforge.net;
 Wed, 29 Jan 2025 17:24:06 +0000
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-7b6f7d7e128so93696585a.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 29 Jan 2025 09:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1738171435; x=1738776235;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6AqjmiYQ2r2JxBlknz3mDpl7pUK+MR/UX2y/MOk5lqw=;
 b=AcK9sc2sVRP0cMp0+hKpBz7sX+chzMC7TTblaHJiQjBykDDzPm0hlmRfAT1BMaFJKm
 yagq+IhnzXzFqVMjK4s51yet4BDItjp0vMBQkQ2IJDq9txHSjLl+zxlzzCu8O7SHo3bX
 Bylr6xICLnwoay8zRqrpkKeG1PpEALdESWd2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738171435; x=1738776235;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6AqjmiYQ2r2JxBlknz3mDpl7pUK+MR/UX2y/MOk5lqw=;
 b=E1KunAeYfGvcYGEEAYJBampZft+GvN/sMhin0veOaS/sUIX/JzmROyqqdovJK//fld
 WZZDQ8IUzRy19bp2qK+wmOd9AhY8a44UGTWTJDiW303VARrefz+B9Gx8tjrMhTvFyXPP
 0ROBpoIAz03WGfmbCAfPC+86XUFyUfrS5HjCeqCz1W8F4dxENNlpFlhJVCvUeL6kS7Mf
 d5SbaADohog+8uk/NbqKOMknJ4/n/ceVsTXgWwmssBKVhhqlV58r3XKxS/qDECCuYaVK
 fbuW91hTV1cPDwsKahyVq1HDzmyrUgQbzRB4YqDiFg9phEqqAZIZTygD55Cd3oEOtx2Q
 qC7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp4lyEQ8nuN2oWtR7DQe20atvVdJzv8l6Tc9XDwa8K9L8HnXqMQV0o+Mqk3wgwqqEHwlZM7vY7tY6BtEJILg==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyNAAXSntTtFNeFWOmyi0JFTKLF3o/ARAhXWYFpqNnNsACqfzPY
 zgddAeqkwv7h5Th8eK3Op5ZCp/W+o0zGYbcTaXNscmaOE0u5mqqa9ikzAptMOcRqCcDjikeVE6w
 =
X-Gm-Gg: ASbGncumPQ9xOX/+JZSnonvB2B82UaiJFFbQEf4e9u+QqaCuR2F4JqZmywNyd8zDedL
 +nH8w0vgxEDY9RI2ymXasWVYbo0ifyLiEObzNs5x9S4RPpfFLB9wJnXDSSgNAj4jrJnn4KgEEpm
 ozgKPsY2VOrS1Npr5yYGu+avZ9oPs1uQF3mhByznZUPUAHrIBFLQpBdfIExEqSOjCRGx21uyRf9
 Syv4ZcAGqO3vwMSXf203b9/vIUy53oa2ct9wFx3c9uoZaWKdKliFr2VFuzE9czlDle6XFnD6NLW
 BB+MPS1cVbYiWvOqr9oKR6q3lZJ9CNJqmAg7QhE7J2nyEw==
X-Google-Smtp-Source: AGHT+IE/VFwz1cAbCXuL77U+nqFDurQyZmhqNdQE3rMj9VMcAjYu039NpeF11AckPBSIZB8gTuRRng==
X-Received: by 2002:a05:6a20:3950:b0:1e0:c166:18ba with SMTP id
 adf61e73a8af0-1ed7a538802mr5899956637.12.1738168049961; 
 Wed, 29 Jan 2025 08:27:29 -0800 (PST)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fa8a:f68a:6cb9:40b2])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ac496cb4810sm10577009a12.66.2025.01.29.08.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 08:27:28 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Daniel Thompson <danielt@kernel.org>
Date: Wed, 29 Jan 2025 08:25:49 -0800
Message-ID: <20250129162700.848018-1-dianders@chromium.org>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
MIME-Version: 1.0
X-Spam-Score: -1.5 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: As pointed out in the review [1] of commit 39d0be87438a
 ("serial:
 kgdb_nmi: Remove unused knock code"), it's not just the knock code that's
 unused but a whole chunk of NMI-related code in KGDB. Look back at the
 original
 series [2] and revert a few of the patches that managed to land and had no
 other purpose. They've been in the kernel for over 12 years and if nobody
 has used them during that [...] 
 Content analysis details:   (-1.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.222.171 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.222.171 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.222.171 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.171 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tdBnJ-0005xT-LZ
Subject: [Kgdb-bugreport] [PATCH 0/3] kdb: Delete never used KGDB NMI code
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
Cc: Nir Lichtman <nir@lichtman.org>, Robert Marko <robert.marko@sartura.hr>,
 "Dr . David Alan Gilbert" <linux@treblig.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@kernel.org>,
 Zheng Zengkai <zhengzengkai@huawei.com>, kgdb-bugreport@lists.sourceforge.net,
 Niklas Schnelle <schnelle@linux.ibm.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Anton Vorontsov <anton.vorontsov@linaro.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Thorsten Blum <thorsten.blum@linux.dev>, linux-kernel@vger.kernel.org,
 Yuran Pereira <yuran.pereira@hotmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

As pointed out in the review [1] of commit 39d0be87438a ("serial:
kgdb_nmi: Remove unused knock code"), it's not just the knock code
that's unused but a whole chunk of NMI-related code in KGDB.

Look back at the original series [2] and revert a few of the patches
that managed to land and had no other purpose. They've been in the
kernel for over 12 years and if nobody has used them during that time
then they won't get used.

I've validated things still compile just fine for me and I've tested
"allmodconfig" for a few different architectures. Hopefully I didn't
miss anything, but based on "grep" this is all just dead code.

I guess I'd expect this to land through Greg KH's tree, ideally Acked
by Daniel Thompson.

[1] https://lore.kernel.org/r/CAD=FV=VH5YWfTggGNt2KLoSPKqVTmWArEgccok3uFQ5BCA7cNw@mail.gmail.com
[2] https://lore.kernel.org/lkml/1348522080-32629-9-git-send-email-anton.vorontsov@linaro.org/


Douglas Anderson (3):
  Revert "tty/serial: Add kgdb_nmi driver"
  Revert "kdb: Implement disable_nmi command"
  Revert "kernel/debug: Mask KGDB NMI upon entry"

 drivers/tty/serial/Kconfig    |  19 ---
 drivers/tty/serial/Makefile   |   1 -
 drivers/tty/serial/kgdb_nmi.c | 280 ----------------------------------
 drivers/tty/serial/kgdboc.c   |   8 -
 include/linux/kgdb.h          |  11 --
 kernel/debug/debug_core.c     |  14 +-
 kernel/debug/kdb/kdb_main.c   |  37 -----
 7 files changed, 3 insertions(+), 367 deletions(-)
 delete mode 100644 drivers/tty/serial/kgdb_nmi.c

-- 
2.48.1.262.g85cc9f2d1e-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
