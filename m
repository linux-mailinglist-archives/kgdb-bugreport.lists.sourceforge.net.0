Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E971EC454
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  2 Jun 2020 23:32:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jgEWI-0002S2-UU
	for lists+kgdb-bugreport@lfdr.de; Tue, 02 Jun 2020 21:32:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jgEWH-0002Rj-KM
 for kgdb-bugreport@lists.sourceforge.net; Tue, 02 Jun 2020 21:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m9kn62PqAX47M9GdWLUtWEHWFrrXZP2eF+NQ55cvCow=; b=JAeiQC5aw6Hoz9PBMRyaqDDIF8
 HKusOndSXwMkjwkb4Uektw3CwtbZXeePOxeRYcmVbq2Q8qGqL7vNNCouK4GKXqs1Lnp8dOQ827vAU
 3ijnrfL7NGZ1HukvVLB0Vfx/uoffdOVGWglw8lPheHWal8FLLL9zejFrMFSLjEE09Ifc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m9kn62PqAX47M9GdWLUtWEHWFrrXZP2eF+NQ55cvCow=; b=EyMMJ8elUqNRJqkWeMH6/Xsj3w
 8Ht83Q1TM687N5MhUzhuIKMFQQpFht7xoxZw9XZaFpPL5avvrInS6mpTzOU81htlqR0tYFupDACFN
 e8u4wYEaO6XbDJ6fjWcYvypHc4Om5CnEfxAH0RHPJyqKwgGA1Z8Tr63E5B6bRlZbnj0E=;
Received: from mail-vs1-f66.google.com ([209.85.217.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jgEWE-006pQX-UR
 for kgdb-bugreport@lists.sourceforge.net; Tue, 02 Jun 2020 21:32:25 +0000
Received: by mail-vs1-f66.google.com with SMTP id y123so153901vsb.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 02 Jun 2020 14:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m9kn62PqAX47M9GdWLUtWEHWFrrXZP2eF+NQ55cvCow=;
 b=SDLDlNa2JxAHtTUthkbE/nmVRXVihXNqZOfFZYLWMG5r+lFumi+7JFsdsehrTevXOO
 sCMLupns01dIukJUzu+RAzsGgJTsGMJ0hdFyNazYDLeWHUCALEfmotGmMzlzrMCgn33I
 Ur8gkspMU96YkoSIkFWxipJQ6pyHI+/nTKxZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m9kn62PqAX47M9GdWLUtWEHWFrrXZP2eF+NQ55cvCow=;
 b=n08zn9EwMijTrzYc+xwRzV5Sbrf5weuVwjxXPr8PFxuo1ULTR+LGUcuQnuK0/VdIcv
 lXeGGVK68KTIaKjP6mynTSjso4bvHaItTkUTABb4HLzWVoOml87PmANhvXm6uJ/xp9SF
 dVIl+tRYu4WZDw7Sar6j2Aea9ZqFKV89vg5TGqpNQlu+2NptlNrTJHWfJReFoYNR47W7
 556Di3d+67wwPpWgVZ05DYXLTBechXXpw6/iC9bhPJzJ99Z/YfJsAFrmsnmePME4HDIo
 YyOcMG/87rcCTks0CLMCsnyBHomb++7/dt2To8SsY2cIj1nveX5AeDdB1/izDQBlqcIA
 yfUw==
X-Gm-Message-State: AOAM531avexKUIXay5OWyIJ+uf+OSVYo30Joa9QlaXwJg5oNInztCevx
 He28oDZbe240mLAfNyHazKlT7JB6soU=
X-Google-Smtp-Source: ABdhPJzX69RKbN81CY53BBekXsfnSeOTvKBG9++6E7/GXyEQBXTgzcYA2qefqKlqT6Xajy1jGOb4XA==
X-Received: by 2002:a67:2dc1:: with SMTP id t184mr6855763vst.90.1591133536774; 
 Tue, 02 Jun 2020 14:32:16 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com.
 [209.85.222.49])
 by smtp.gmail.com with ESMTPSA id k5sm32891vke.0.2020.06.02.14.32.15
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 14:32:15 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id b13so130628uav.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 02 Jun 2020 14:32:15 -0700 (PDT)
X-Received: by 2002:ab0:1684:: with SMTP id e4mr18561066uaf.22.1591133535074; 
 Tue, 02 Jun 2020 14:32:15 -0700 (PDT)
MIME-Version: 1.0
References: <1590751607-29676-1-git-send-email-sumit.garg@linaro.org>
 <1590751607-29676-2-git-send-email-sumit.garg@linaro.org>
In-Reply-To: <1590751607-29676-2-git-send-email-sumit.garg@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 2 Jun 2020 14:32:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WVdRcvfR-O-A2809AqFggqhJmvrTSo9qafxq=DgSbLrw@mail.gmail.com>
Message-ID: <CAD=FV=WVdRcvfR-O-A2809AqFggqhJmvrTSo9qafxq=DgSbLrw@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jgEWE-006pQX-UR
Subject: Re: [Kgdb-bugreport] [PATCH v4 1/4] kdb: Re-factor kdb_printf()
 message write code
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
Cc: Petr Mladek <pmladek@suse.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, LKML <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Fri, May 29, 2020 at 4:27 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Re-factor kdb_printf() message write code in order to avoid duplication
> of code and thereby increase readability.
>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  kernel/debug/kdb/kdb_io.c | 61 +++++++++++++++++++++++++----------------------
>  1 file changed, 32 insertions(+), 29 deletions(-)
>
> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> index 924bc92..e46f33e 100644
> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -542,6 +542,33 @@ static int kdb_search_string(char *searched, char *searchfor)
>         return 0;
>  }
>
> +static void kdb_io_write(char *cp, int len)

nit: "const char *" just to make it obvious that we don't modify the string?


> +{
> +       if (len == 0)
> +               return;

Remove the above check.  It's double-overkill.  Not only did you just
check in kdb_msg_write() but also the while loop below will do a
"no-op" just fine even without your check.


> +
> +       while (len--) {
> +               dbg_io_ops->write_char(*cp);
> +               cp++;
> +       }
> +}
> +
> +static void kdb_msg_write(char *msg, int msg_len)

nit: "const char *" just to make it obvious that we don't modify the string?


Other than those small things, this looks nice to me.  Feel free to
add my Reviewed-by tag once small things are fixed.


-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
