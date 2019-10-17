Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBF8DA47F
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 17 Oct 2019 06:10:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iKx7e-0007Ct-2H
	for lists+kgdb-bugreport@lfdr.de; Thu, 17 Oct 2019 04:10:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1iKx7c-0007Cm-SJ
 for kgdb-bugreport@lists.sourceforge.net; Thu, 17 Oct 2019 04:10:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WfD6ayjfYqzqP/LVh7w+bvnD4qYp9ltqa0DyJebxkC8=; b=DPtXe0OEyIyLHMRqFyh+oQjeEd
 K9VQr7g3nIVCgENLwhABdbDtrRCtgJ9t+7zHPfHd2dsKc75XNK+Y4KON0Yu67/wtKh8e5rIU6nxCo
 b/kLrZjOKuMRFkdZ+sPH5bXBTYKHHi6kPe6R2hr888odgS3F8gdM0Gl7kRRrs2HWpPY0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WfD6ayjfYqzqP/LVh7w+bvnD4qYp9ltqa0DyJebxkC8=; b=Ey96VL6rxyzVsInlPeDsMtuEbq
 ylq/QKdjZUFgA3QkenYrIhE2xNynx0O9lDNVBoTH18jRcb9hHNkyYZ8gk5kXhxwqu3eSqz03iv/aX
 y+pl9sLf7jcNJNPU7RP9YFYVuyvTi+huY/d/WfEPafKYVpEarxt7tA+E0rtGxtRy84Fw=;
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iKx7Z-00C0Op-8C
 for kgdb-bugreport@lists.sourceforge.net; Thu, 17 Oct 2019 04:10:44 +0000
Received: by mail-il1-f194.google.com with SMTP id a5so677275ilh.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 16 Oct 2019 21:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WfD6ayjfYqzqP/LVh7w+bvnD4qYp9ltqa0DyJebxkC8=;
 b=eVZWpuNmW1LjNbZB427rwnRwJXN0K6rrcRk6OTdb3sr/zasrjkEs/A6KN26Cl4NOl3
 +Rh0iGrfl7+aOKNCCEMIh2A3m1oVJSUmRHxt8CczU8cOAzykww/p2p9sxc9HAvHHCShw
 QK5OCE7VBb+gc/OnQ/oiYModNGH7UBHpO0RGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WfD6ayjfYqzqP/LVh7w+bvnD4qYp9ltqa0DyJebxkC8=;
 b=GbwrvwILEEyQtNaIrB/4340zaMksgZ3MzHdevEY1gQRjhNWP5ydDX8U7UuAIEvtcyl
 DIDVRrR9kS+NKG9r/KQJgniWUkTX2fROBVxCi1wd+O0D2yDoy4VnmzHjBW7fyTQ34nqV
 MyXVMljrPfhQvVfNjVLrkxRlvrucyF7HEbiRskmcveH3A1DubH8YDC8Q+76wWDUgqcdc
 kAlwMgyrMMxmHZ9A3GH4SCxXVjEAKUkY5yf72Y5pRE/U2BP8eHeCGiI686Ji7QuS05br
 RaZb7O6XfwVSb99uep6+iw8FBGesz1U1ri/bUoQxX5xT1iTNw+H88Itom4FwSrPeHrZV
 LApg==
X-Gm-Message-State: APjAAAWKSZrkQFt6oGShJ2Z3sp3M0hqByCPTvA91KpxgGx4xoVPuyef6
 ji8hJd9coYVAyVf2k4Gx47zuG+Lw84c=
X-Google-Smtp-Source: APXvYqySziPpffXs5LRJcKNNUvB2h63rquMDlVeqSa2ITs390ipQyalM6bK/7gaRXGobEhAbxPYPKQ==
X-Received: by 2002:a92:4708:: with SMTP id u8mr1389647ila.213.1571285435182; 
 Wed, 16 Oct 2019 21:10:35 -0700 (PDT)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com.
 [209.85.166.42])
 by smtp.gmail.com with ESMTPSA id q66sm460143ili.69.2019.10.16.21.10.34
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Oct 2019 21:10:34 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id h144so1272090iof.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 16 Oct 2019 21:10:34 -0700 (PDT)
X-Received: by 2002:a5d:9952:: with SMTP id v18mr1049308ios.58.1571285433894; 
 Wed, 16 Oct 2019 21:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20191014154626.351-1-daniel.thompson@linaro.org>
 <20191014154626.351-4-daniel.thompson@linaro.org>
In-Reply-To: <20191014154626.351-4-daniel.thompson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Oct 2019 21:10:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W44zXesz8b8Z05_k7JjPW8D9z8fGT3GiGFSmSLw85zMQ@mail.gmail.com>
Message-ID: <CAD=FV=W44zXesz8b8Z05_k7JjPW8D9z8fGT3GiGFSmSLw85zMQ@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.2 RCVD_IN_BL_SPAMCOP_NET RBL: Received via a relay in bl.spamcop.net
 [Blocked - see <https://www.spamcop.net/bl.shtml?209.85.166.194>]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.194 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.8 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iKx7Z-00C0Op-8C
Subject: Re: [Kgdb-bugreport] [PATCH v3 3/5] kdb: Remove special case logic
 from kdb_read()
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
Cc: kgdb-bugreport@lists.sourceforge.net, Patch Tracking <patches@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Mon, Oct 14, 2019 at 8:46 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> @@ -91,12 +92,17 @@ kdb_bt1(struct task_struct *p, unsigned long mask,
>         kdb_ps1(p);
>         kdb_show_stack(p, NULL);
>         if (btaprompt) {
> -               kdb_getstr(buffer, sizeof(buffer),
> -                          "Enter <q> to end, <cr> to continue:");
> -               if (buffer[0] == 'q') {
> -                       kdb_printf("\n");
> +               kdb_printf("Enter <q> to end, <cr> or <space> to continue:");
> +               ch = kdb_getchar();
> +               while (!strchr("\r\n q", ch))
> +                       ch = kdb_getchar();

nit: above 3 lines would be better with "do while", AKA:

do {
  ch = kdb_getchar();
} while (!strchr("\r\n q", ch));


> @@ -50,14 +50,14 @@ static int kgdb_transition_check(char *buffer)
>  }
>
>  /*
> - * kdb_read_handle_escape
> + * kdb_handle_escape

Optional nit: while you're touching this comment, you could make it
kerneldoc complaint.


> @@ -152,7 +158,7 @@ static int kdb_read_get_key(char *buffer, size_t bufsize)
>                                 return '\e';
>
>                         *ped++ = key;
> -                       key = kdb_read_handle_escape(escape_data,
> +                       key = kdb_handle_escape(escape_data,
>                                                      ped - escape_data);

nit: indentation no longer lines up for the "ped - escape_data" line.

Nothing here is terribly important, thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
