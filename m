Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E24120FFE1
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  1 Jul 2020 00:08:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jqOQ2-0006P1-UZ
	for lists+kgdb-bugreport@lfdr.de; Tue, 30 Jun 2020 22:07:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jqOQ1-0006Ou-NI
 for kgdb-bugreport@lists.sourceforge.net; Tue, 30 Jun 2020 22:07:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vsVPUs6oOpXrACcVe8J7okfB5Na/aATuG3ZrUARrR+o=; b=DNCs3fi+QidMHLvk8AXCw25wNl
 GGCtkNgmcZTrO1AzH4MY2MbrMnSX/U80CQAF/bKL7Vrb2o3aZR7XKOpNxlOZW7WUFxxRd7fSSf+qB
 Y9cElEANW8h9toX2psL89AqhA4SNAXm8JSO8xS6l9pqggzx+8A/Lly4UHw3TF8mBlq6M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vsVPUs6oOpXrACcVe8J7okfB5Na/aATuG3ZrUARrR+o=; b=mTZAsJMHJt+yAGyGpVrtGW7b4R
 2Eu9jJiX2sdJ3E5y6pSGFv7ik9w0dMXlkVlUZ+i1QljipPDF5N8nf0CbN+cXPWcXLY6WrK/WyHL+1
 zWpBIlJSvUDlx1hU3tN4CCZ3pEwiRWIYf/aVkKDqM7dI5TrevSgaLxpypkFIA7KZpXdg=;
Received: from mail-ua1-f68.google.com ([209.85.222.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jqOQ0-006VLi-CS
 for kgdb-bugreport@lists.sourceforge.net; Tue, 30 Jun 2020 22:07:57 +0000
Received: by mail-ua1-f68.google.com with SMTP id c7so5561918uap.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 30 Jun 2020 15:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vsVPUs6oOpXrACcVe8J7okfB5Na/aATuG3ZrUARrR+o=;
 b=OaWmz2OxVFNRTx41A5fhDgQEfJWIZ3icsae1NZWDkZ53+d5YIklVehWkJbuWmmc4Cj
 p9OrDN8JvscQL+sOQgSJqBmo1il96akLXLRI4UhKlf9GaYzUag6wqH8HlHcOh0f/ft3Y
 9L7aGqXZ1DHCXIBehmOUl2ZwO8o2Ft+iAvd7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vsVPUs6oOpXrACcVe8J7okfB5Na/aATuG3ZrUARrR+o=;
 b=APH/WEveZD5CcRAew2oUtKf2rJigX/VJ0aXxsLKR6u4x4acLVLYkHC4YourknjAcu3
 /YNiHp/DWkP6uFAnOez13YIdz9a3l8AQdm4CWkVjuIVK+/RQa5ALGTMoQIb/VZvPMh5x
 SjuHmjGJ1lgSo6Xewa0YL8a4qqBmxoHB+3rjQBJtUs10WFJ1NbKdXTtk4D7x2gtcdJov
 +B6EvS0HuQ4WD8YSEQcWyFEWe0cNvh/zQHDxfLUMg4GEX7YL4XjJ2BndVvB4GQUS02FB
 ikmdYUC/XM9rJMxhx3tAg+A8yF5eWnLM2O3+qqaSG1RhDzoThw+Cw1vvC5Dx5J76Xzmo
 5oew==
X-Gm-Message-State: AOAM531dyXumcQc2DXvoVQDpdG2+HXnBCVLxUclPXaWJhS7LUenYq7xC
 s+bs9EGfcYGJQek3ancTKRetS9i4ptM=
X-Google-Smtp-Source: ABdhPJww0VJBdSbxLaiicMbZQzda2OTJ7H8xhxTKFp+i4P/3SCgXsTa71iZphoQl1QyQQ4HcklUzTA==
X-Received: by 2002:a9f:30c8:: with SMTP id k8mr15265676uab.130.1593554870361; 
 Tue, 30 Jun 2020 15:07:50 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com.
 [209.85.217.42])
 by smtp.gmail.com with ESMTPSA id t76sm645458vkt.56.2020.06.30.15.07.49
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2020 15:07:49 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id k7so10810297vso.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 30 Jun 2020 15:07:49 -0700 (PDT)
X-Received: by 2002:a67:6546:: with SMTP id z67mr9645652vsb.169.1593554869192; 
 Tue, 30 Jun 2020 15:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200630174943.GA34614@mwanda>
In-Reply-To: <20200630174943.GA34614@mwanda>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 30 Jun 2020 15:07:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U_c8Nr1E0-q56sfxk20SPpBDMW3HifGb7zpa5the7MDw@mail.gmail.com>
Message-ID: <CAD=FV=U_c8Nr1E0-q56sfxk20SPpBDMW3HifGb7zpa5the7MDw@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.68 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.68 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jqOQ0-006VLi-CS
Subject: Re: [Kgdb-bugreport] [bug report] kdb: Switch to use safer
 dbg_io_ops over console APIs
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
Cc: kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Tue, Jun 30, 2020 at 10:49 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Hello Sumit Garg,
>
> This is a semi-automatic email about new static checker warnings.
>
> The patch 5946d1f5b309: "kdb: Switch to use safer dbg_io_ops over
> console APIs" from Jun 4, 2020, leads to the following Smatch
> complaint:
>
>     kernel/debug/kdb/kdb_io.c:565 kdb_msg_write()
>     error: we previously assumed 'dbg_io_ops' could be null (see line 552)
>
> kernel/debug/kdb/kdb_io.c
>    551
>    552          if (dbg_io_ops) {
>                     ^^^^^^^^^^
> Check for NULL
>
>    553                  const char *cp = msg;
>    554                  int len = msg_len;
>    555
>    556                  while (len--) {
>    557                          dbg_io_ops->write_char(*cp);
>    558                          cp++;
>    559                  }
>    560          }
>    561
>    562          for_each_console(c) {
>    563                  if (!(c->flags & CON_ENABLED))
>    564                          continue;
>    565                  if (c == dbg_io_ops->cons)
>                                  ^^^^^^^^^^
> New unchecked dereference.

Thanks for the report!  Someone else already noticed and so we have:

https://lore.kernel.org/r/20200630082922.28672-1-cengiz@kernel.wtf

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
