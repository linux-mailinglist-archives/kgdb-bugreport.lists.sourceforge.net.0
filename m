Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA3657D171
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 21 Jul 2022 18:25:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1oEYz9-0007ij-9b
	for lists+kgdb-bugreport@lfdr.de; Thu, 21 Jul 2022 16:25:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <dianders@chromium.org>) id 1oEYz2-0007ib-J0
 for kgdb-bugreport@lists.sourceforge.net; Thu, 21 Jul 2022 16:25:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CdzyaaSS9wVD/EeKAhIRDfgg/YpGZ+e1ODi82IyhDFc=; b=NlCZEAwLHHptRpXw6ghVCZ6nF6
 iHWEEFbn80vSqqfp17yJ1TQlKCiMCbvziY10y+byhmlzStW6J00OtvaaaRhH+NtRjVWo3dKtrb7wI
 mqccV8UV3VuJ50PLpR1G7jP2WIllKY8opoSqcT3BgBhElilD1b8SXyBEJk+StdalMudk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CdzyaaSS9wVD/EeKAhIRDfgg/YpGZ+e1ODi82IyhDFc=; b=igGg3LTnsndBGjgorajcJz/sgm
 LCoMe/fdi9h0WT/G4bTUV5U3TvPPa9BknTAGXgW2fteiGzdBeytk3JcKbSxT1XX1Vp05+1eDckMnp
 XHm9u98p5GF+Qij6stSpN7VLS+RZ19X4LghiDiRx2CzOXCUsx4RUxz+eFXsyMVEjbeiQ=;
Received: from mail-ej1-f45.google.com ([209.85.218.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1oEYyx-0004An-Rk
 for kgdb-bugreport@lists.sourceforge.net; Thu, 21 Jul 2022 16:25:03 +0000
Received: by mail-ej1-f45.google.com with SMTP id j22so4065619ejs.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 21 Jul 2022 09:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CdzyaaSS9wVD/EeKAhIRDfgg/YpGZ+e1ODi82IyhDFc=;
 b=ixbeGzrVmvVURAdO5sU9OOcCnx0pffmC11dEXfqHTPv7aPiBEc70P0ZZGoaIHU3BTQ
 A9M6pSaNj9xmUq15oOdfCneHQ0oBU1DIhG+Mkm71JN+8EIG3QsRnX+RGJnlZQQZk2ZPm
 Om2nQfvVC8EjD+aZQMkscw2RC8rR7VediHcGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CdzyaaSS9wVD/EeKAhIRDfgg/YpGZ+e1ODi82IyhDFc=;
 b=Nec8IG+oPsnPtxh8nBtuo4uOeQ3AkNn7XOylJNmODPYtU8yjH7kjpMw8P4C/guU7uw
 quRIJyqXC2maLHwEOQn7HFRZ+8TPJf4dbmPZ6VCga3E3PEaoDm93sqGKsxyoDlPgV+G1
 BaNj8coisHIgAHnWV/k94vOHrFR8YY3YK1AUsWZbJJKb8ninF7CYO6X9wjrTrNOG6iZ+
 eHA0+fD1YU3XZnE7aRcKgupxtTNsa9lOCtiekco/dLh6cFJd022w0LkVkYYCGji8qQCI
 qxLc+e1U8iyI8V/28pF33g8WaAR6TB1Cak3aorocN3k5Zc+fQUu22pB7dA37CerKQxlN
 CnwA==
X-Gm-Message-State: AJIora9nMx8K2yVOiOwsUFDp1pvFtLz4Xc5rsOtnrlIGGNKqobn6RmnM
 d/uAJC5AbGjVwGpVXzdOhbC0Lplt5avB1pVMDeo=
X-Google-Smtp-Source: AGRyM1sl/MfEaM122qL24GaPvAmBKnjXnI8JlytXjbVCQGy0g9BHNTG1aPk+b7RlP2Y0tuvSl97Dzw==
X-Received: by 2002:a17:907:2cca:b0:72b:4188:f95b with SMTP id
 hg10-20020a1709072cca00b0072b4188f95bmr42048184ejc.153.1658420690035; 
 Thu, 21 Jul 2022 09:24:50 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42]) by smtp.gmail.com with ESMTPSA id
 fu14-20020a170907b00e00b00726298147b1sm984783ejc.161.2022.07.21.09.24.46
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 09:24:47 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id
 a18-20020a05600c349200b003a30de68697so4016828wmq.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 21 Jul 2022 09:24:46 -0700 (PDT)
X-Received: by 2002:a05:600c:4e86:b0:3a3:2edc:bcb4 with SMTP id
 f6-20020a05600c4e8600b003a32edcbcb4mr4239876wmq.85.1658420686023; Thu, 21 Jul
 2022 09:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220721093042.9840-1-khalid.masum.92@gmail.com>
In-Reply-To: <20220721093042.9840-1-khalid.masum.92@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 Jul 2022 09:24:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UbRX194rDztr_=eoALg4kTmjzq=EXCX6RJSSq3vO=fbw@mail.gmail.com>
Message-ID: <CAD=FV=UbRX194rDztr_=eoALg4kTmjzq=EXCX6RJSSq3vO=fbw@mail.gmail.com>
To: Khalid Masum <khalid.masum.92@gmail.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Thu, Jul 21,
 2022 at 2:31 AM Khalid Masum <khalid.masum.92@gmail.com>
 wrote: > > Currently the command 'lx-symbols' in gdb exits with the
 error`Function
 > "do_init_module" not defined in "kernel/mo [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.45 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.45 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oEYyx-0004An-Rk
Subject: Re: [Kgdb-bugreport] [PATCH RESEND] scripts/gdb: Fix gdb
 'lx-symbols' command
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
Cc: Aaron Tomlin <atomlin@redhat.com>, Pavel Skripkin <paskripkin@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Thu, Jul 21, 2022 at 2:31 AM Khalid Masum <khalid.masum.92@gmail.com> wrote:
>
> Currently the command 'lx-symbols' in gdb exits with the error`Function
> "do_init_module" not defined in "kernel/module.c"`. This occurs because
> the file kernel/module.c was moved to kernel/module/main.c.
>
> Fix this breakage by changing the path to "kernel/module/main.c" in
> LoadModuleBreakpoint.
>
> Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
> ---
>  scripts/gdb/linux/symbols.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/gdb/linux/symbols.py b/scripts/gdb/linux/symbols.py
> index 46f7542db08c..dc07b6d12e30 100644
> --- a/scripts/gdb/linux/symbols.py
> +++ b/scripts/gdb/linux/symbols.py
> @@ -180,7 +180,7 @@ lx-symbols command."""
>                  self.breakpoint.delete()
>                  self.breakpoint = None
>              self.breakpoint = LoadModuleBreakpoint(
> -                "kernel/module.c:do_init_module", self)
> +                "kernel/module/main.c:do_init_module", self)

Fixes: cfc1d277891e ("module: Move all into module/")
Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
