Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7671C584318
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 28 Jul 2022 17:30:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1oH5Sl-0002XL-No
	for lists+kgdb-bugreport@lfdr.de; Thu, 28 Jul 2022 15:30:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <dianders@chromium.org>) id 1oH5Sh-0002XE-9m
 for kgdb-bugreport@lists.sourceforge.net; Thu, 28 Jul 2022 15:30:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aupJBzXbRBMWeUz6YCx7u7A83Uk4qjGDN/B/6Mku+q8=; b=DU6O8KvWLtJI5kpX+858EmZ91N
 7lVS6HgDOVU45OzE0WyzDiBQX29HwmKqSjmUJOYVhHU1QGuDBBhxnePpZSC/dGVKlV4Yf2H0P95ve
 fIUp2wq0FMYvhAzzBLZ8Fp+STxz0KuWIBF9V/1mQzjYx7wzZr0mNHb4YoiJa0VPEQtds=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aupJBzXbRBMWeUz6YCx7u7A83Uk4qjGDN/B/6Mku+q8=; b=LKp9Go+yp5ne11tLFKGQr/0KuB
 pkmu1sks2J2sC/Bil96y2sEhidY5xl1spNgtakZCdztIrcqL88fjhStmZRY6fLSqrZ56v9PuSGMbG
 7dzmY9EigMm28fiO/bsT1gQCf8ahNhRDu9jo5C0sadGymL7/Zm1/Dv5mK1nuA07pPPTk=;
Received: from mail-ej1-f44.google.com ([209.85.218.44])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1oH5Sf-00D4s0-Lm
 for kgdb-bugreport@lists.sourceforge.net; Thu, 28 Jul 2022 15:30:07 +0000
Received: by mail-ej1-f44.google.com with SMTP id ez10so3726209ejc.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 28 Jul 2022 08:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=aupJBzXbRBMWeUz6YCx7u7A83Uk4qjGDN/B/6Mku+q8=;
 b=LIm80Vb5CQ069rOnNC7dzy+Fumvxt87zKwsiZAH6N0gJ4uEJJ6g8AAlfwk6Hj8kuYK
 P0q6FHxLbCFZvDAFAsY6qMz4t7lMEe9I+3h6VZZc3CmdtuDOeXlrt2T2IFH0j36AQ6Ao
 ZgyLdWQ/QczYP7QMAYnGNBfVV1QkxOqm2SZYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=aupJBzXbRBMWeUz6YCx7u7A83Uk4qjGDN/B/6Mku+q8=;
 b=iizsQDN+BYbsHvVwsybALI0HYk49LotHW+7nJN622GdyPxoh6reouEoZ8COk0J5dut
 R2mkWaZnpesuqquoiHH/4TtaHj01umcoFejova/5xu4bbPrafyA50ZDQbUgXL/DF8jdI
 ObYPXVlJ6flqUezXHHVNYi9Wztf3TdzO8I1uPucJoBVfQX1BrdAg9EgDjj+qK5GKuJsK
 mWDHUzpBf/MV0mYSR6dA43zdq5K57WuvICZoBaN5WbiVMT22QAFr40MgdQdy2ypXN4VJ
 rVfM3Px0i1Ak0WDpvH4tFLdXRyq9qbc7MjicpcjLr8Og/0aRwTvgD6aXZxNMZf7wJS9j
 RdnQ==
X-Gm-Message-State: AJIora8e2NuYmh93ptRbtauCv6Rpubamo3ODMtNAEsggYNH4q+d2A0cx
 JzbL1xSmqp2OiBivL64gvnHfBcf1jYvpgbKa
X-Google-Smtp-Source: AGRyM1t8erccMr2hyAU9z2BCJlHRJchoKUS6u5DYWZ8bnngPULyrKhQUperSOagC4TZMDI/2e9Oj7w==
X-Received: by 2002:a17:907:2e0d:b0:72b:5cf4:464a with SMTP id
 ig13-20020a1709072e0d00b0072b5cf4464amr21009330ejc.87.1659022198956; 
 Thu, 28 Jul 2022 08:29:58 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41]) by smtp.gmail.com with ESMTPSA id
 gg18-20020a170906899200b00715705dd23asm523938ejc.89.2022.07.28.08.29.57
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 08:29:58 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id a11so1146947wmq.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 28 Jul 2022 08:29:57 -0700 (PDT)
X-Received: by 2002:a05:600c:1549:b0:3a3:2aa2:6f60 with SMTP id
 f9-20020a05600c154900b003a32aa26f60mr6915481wmg.57.1659022197135; Thu, 28 Jul
 2022 08:29:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220712110248.1404125-1-atomlin@redhat.com>
In-Reply-To: <20220712110248.1404125-1-atomlin@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 28 Jul 2022 08:29:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WwAO-QDBmfODJ+-8nzN_+m=3drRhMg7mRd-82U4RML=g@mail.gmail.com>
Message-ID: <CAD=FV=WwAO-QDBmfODJ+-8nzN_+m=3drRhMg7mRd-82U4RML=g@mail.gmail.com>
To: Aaron Tomlin <atomlin@redhat.com>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Tue, Jul 12,
 2022 at 4:03 AM Aaron Tomlin <atomlin@redhat.com>
 wrote: > > Post 'make scripts_gdb' a symbolic link to
 scripts/gdb/vmlinux-gdb.py
 > is created. Currently 'os.path.dirname(__file__)' d [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.44 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.44 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oH5Sf-00D4s0-Lm
Subject: Re: [Kgdb-bugreport] [PATCH v2] scripts/gdb: Ensure the absolute
 path is generated on initial source
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
Cc: kgdb-bugreport@lists.sourceforge.net, Kieran Bingham <kbingham@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, atomlin@atomlin.com,
 Jan Kiszka <jan.kiszka@siemens.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Tue, Jul 12, 2022 at 4:03 AM Aaron Tomlin <atomlin@redhat.com> wrote:
>
> Post 'make scripts_gdb' a symbolic link to scripts/gdb/vmlinux-gdb.py
> is created. Currently 'os.path.dirname(__file__)' does not generate
> the absolute path to scripts/gdb resulting in the following:
>
>     (gdb) source vmlinux-gdb.py
>     Traceback (most recent call last):
>       File "scripts/gdb/vmlinux-gdb.py", line 25, in <module>
>         import linux.utils
>     ModuleNotFoundError: No module named 'linux'
>
> This patch ensures that the absolute path to scripts/gdb in relation to
> the given file is generated so each module can be located accordingly.
>
> Signed-off-by: Aaron Tomlin <atomlin@redhat.com>
> ---
>  scripts/gdb/vmlinux-gdb.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/gdb/vmlinux-gdb.py b/scripts/gdb/vmlinux-gdb.py
> index 4136dc2c59df..3e8d3669f0ce 100644
> --- a/scripts/gdb/vmlinux-gdb.py
> +++ b/scripts/gdb/vmlinux-gdb.py
> @@ -13,7 +13,7 @@
>
>  import os
>
> -sys.path.insert(0, os.path.dirname(__file__) + "/scripts/gdb")
> +sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)) + "/scripts/gdb")

It seems to generate an absolute path for me, but some quick web
searches show that it's not guaranteed so I guess you must be hitting
whatever corner cases it ends up being relative.

The fix seems reasonable to me, thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
