Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C00974C2A
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 25 Jul 2019 12:50:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hqbKO-0002qr-VH
	for lists+kgdb-bugreport@lfdr.de; Thu, 25 Jul 2019 10:50:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jim.cromie@gmail.com>) id 1hldzx-0004VW-2s
 for kgdb-bugreport@lists.sourceforge.net; Thu, 11 Jul 2019 18:40:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wsq47k2EXTsIUO+CmGgL2wc10RNtOrfWULqekm8gAg8=; b=aVGZyYXNT98ByKqrx6p0HonHrn
 m6dL1961VE/JuSGtVxZ2Sq30iROh27rlEbec63HjFEc66BrvvYmpuVvS7SOwREUs0Uz0S9CJ/bEA7
 hQx5gxFD+HuW3iCVxmHsdPOUSodo7LeKCPQRo3IaL7PDE2Tx+zvhApiZJhpBhc+rBDq8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wsq47k2EXTsIUO+CmGgL2wc10RNtOrfWULqekm8gAg8=; b=U
 mtIK4AWkNM/uz3iwQQaw7wQi7ReRaMOPB1olNtjvBM8yV6xFGiR5uBKbWw3FXT1VTNVQnSc4NgMQy
 CvFWFEhzmC59qzLjtHaPvBgt43wHOHGgKx5B1WTpyBBzTOlSoGu32PqDlkJ7vyYXdLrHLyKCp3TXH
 s9NuUxTph/5VQEbg=;
Received: from mail-lj1-f181.google.com ([209.85.208.181])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hldzv-00GIjh-LE
 for kgdb-bugreport@lists.sourceforge.net; Thu, 11 Jul 2019 18:40:53 +0000
Received: by mail-lj1-f181.google.com with SMTP id t28so6808679lje.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 11 Jul 2019 11:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=wsq47k2EXTsIUO+CmGgL2wc10RNtOrfWULqekm8gAg8=;
 b=a6tgqUDXYjS/ShQeDaw+wMGg1xzFlzGMRJlZMf+S+CJ/6kkKchDw9aHWDfYWc1YiEr
 koJ7Kc6eStXMgQUs8St7taXinPpZpasdafGJzRsuYGRHBPQBMQukjgteK3yb4jtjLGtE
 v2TejyHdpp7HFPWxmSSE+avkYCqPrUx9rdik4pMrgZKbzlTBNe7JPQHbgBCF7C6ECzbK
 sG1OLBSYBNKaLLq/4DURBSj3WLk2lyx52Fs6xwMNgatcZemGxBWavoe8NZOkVVUqbjkZ
 gMYW/r3WCYl8tZS5ZDiU36TKVXi1N3DF/jkRorvb80maeF6nFyc5P3Al76jYbZloW14f
 FQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=wsq47k2EXTsIUO+CmGgL2wc10RNtOrfWULqekm8gAg8=;
 b=eCw7Ege/hRnvGWT0NM7Ph0X4ANJM7ihB44i+pQ6tI/t9u43VuIbLDkf7HitHv9C2Zu
 iAmWxzT3wAElP+iqCtWNsyT3ROL85SEw33eg0MNMUp+G3tSrNd8DwEBqXrS27B2QvJSH
 iSTKlEq/b/3KcR5sxN9wueoL1rgXA98JeGnNgaukvKnP1aoMcwl0QnRdKD2M1OpCV159
 swg8PEcHRL9SqHQM0hLsvYm57ycfrnWcA7DoJ3scUDcNmoTENoh9ssCvA8+e1KGoCeKY
 pkumo0Au+UGhpSiOusjagoEggaGz3xdaUzc9aLpifytueyZOhzZdRNxFtzGWWchQPOSm
 UVvA==
X-Gm-Message-State: APjAAAV7wzwngLMpQ047VGDzeSj7OYR2ebWDKqPE7tKdDB8Xhch+xmuq
 gIAqzJE0DTGGiDSFGoq1tcYdDHEUfD6f6yiHKBFiubA2
X-Google-Smtp-Source: APXvYqwugRP+hcB5lC+Awiwog6Tib1tmxrmMht/UZZEbvSESLsXjgzHlV1/PNuBlSxCqrU/YsYN9b2r8rFnynDoVZTU=
X-Received: by 2002:a2e:9788:: with SMTP id y8mr3363908lji.41.1562870444300;
 Thu, 11 Jul 2019 11:40:44 -0700 (PDT)
MIME-Version: 1.0
From: jim.cromie@gmail.com
Date: Thu, 11 Jul 2019 12:40:18 -0600
Message-ID: <CAJfuBxyXpWK0Z5CAhE8T-_np4LEZQaa6jUX7X7z14D11+mCxvA@mail.gmail.com>
To: kgdb-bugreport@lists.sourceforge.net
X-Spam-Score: 1.2 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (jim.cromie[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.181 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.3 PDS_NO_HELO_DNS        High profile HELO but no A record
X-Headers-End: 1hldzv-00GIjh-LE
X-Mailman-Approved-At: Thu, 25 Jul 2019 10:50:25 +0000
Subject: [Kgdb-bugreport] kgdbts: ERROR hw_access_break_test test failed
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

hi there,

so I googled subject, it hasnt happened since 2008, apparently.
this is an old tired 686 box, and is possibly long-standing issue.


Jul 11 05:44:31 popeye kernel: Linux version 5.2.0-j1 (jimc@popeye)
(gcc version 9.1.1 20190503 (Red Hat 9.1.1-1) (GCC)) #101 SMP Tue Jul
9 14:05:51 MDT 2019

Jul 11 05:44:31 popeye kernel: kgdbts:RUN hw write breakpoint test
Jul 11 05:44:31 popeye kernel: kgdbts:RUN access write breakpoint test
Jul 11 05:44:31 popeye kernel: kgdbts: ERROR hw_access_break_test test failed
Jul 11 05:44:31 popeye kernel: WARNING: CPU: 1 PID: 1 at
drivers/misc/kgdbts.c:903 run_hw_break_test.cold+0x15/0x38
Jul 11 05:44:31 popeye kernel: Modules linked in:
Jul 11 05:44:31 popeye kernel: CPU: 1 PID: 1 Comm: swapper/0 Not
tainted 5.2.0-j1 #101
Jul 11 05:44:31 popeye kernel: Hardware name: Dell Inc. OptiPlex 760
              /0R230R, BIOS A16 08/06/2013
Jul 11 05:44:31 popeye kernel: EIP: run_hw_break_test.cold+0x15/0x38
Jul 11 05:44:31 popeye kernel: Code: 04 24 7c db 71 d2 e8 6f 34 a8 ff
b8 e4 ff ff ff e9 1b f1 ff ff c7 04 24 c4 db 71 d2 a1 e4 a9 a3 d2 89
44 24 04 e8 50 34 a8 ff <0f> 0b e9 b4 f1>
Jul 11 05:44:31 popeye kernel: EAX: 0000002e EBX: 00000000 ECX:
d29d22e8 EDX: 00000001
Jul 11 05:44:31 popeye kernel: ESI: 000003e8 EDI: 00000001 EBP:
f40d7ee8 ESP: f40d7ee0
Jul 11 05:44:31 popeye kernel: DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS:
0068 EFLAGS: 00010286
Jul 11 05:44:31 popeye kernel: CR0: 80050033 CR2: 00000000 CR3:
129c2000 CR4: 000406d0
Jul 11 05:44:31 popeye kernel: DR0: d2a3aab4 DR1: 00000000 DR2:
00000000 DR3: 00000000
Jul 11 05:44:31 popeye kernel: DR6: ffff0ff1 DR7: 00000600
Jul 11 05:44:31 popeye kernel: Call Trace:
Jul 11 05:44:31 popeye kernel:  configure_kgdbts+0x1bf/0x380
Jul 11 05:44:31 popeye kernel:  ? printk+0xe/0x10
Jul 11 05:44:31 popeye kernel:  ? loop_init+0x130/0x130
Jul 11 05:44:31 popeye kernel:  init_kgdbts+0x11/0x16
Jul 11 05:44:31 popeye kernel:  do_one_initcall+0x3a/0x1b3
Jul 11 05:44:31 popeye kernel:  ? __wake_up_common_lock+0x95/0xc0
Jul 11 05:44:31 popeye kernel:  ? do_early_param+0x73/0x73
Jul 11 05:44:31 popeye kernel:  kernel_init_freeable+0x138/0x1bf
Jul 11 05:44:31 popeye kernel:  ? rest_init+0x85/0x85
Jul 11 05:44:31 popeye kernel:  kernel_init+0x8/0xdb
Jul 11 05:44:31 popeye kernel:  ret_from_fork+0x19/0x24
Jul 11 05:44:31 popeye kernel: ---[ end trace 2436c6ccd5dc743b ]---
b


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
