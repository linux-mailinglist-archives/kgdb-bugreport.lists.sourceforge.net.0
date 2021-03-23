Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D767A3457A8
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 23 Mar 2021 07:14:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lOaJ5-0004Vw-Kw
	for lists+kgdb-bugreport@lfdr.de; Tue, 23 Mar 2021 06:14:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1lOaJ0-0004Vb-F0
 for kgdb-bugreport@lists.sourceforge.net; Tue, 23 Mar 2021 06:14:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9a7WpLfMa2pUk8U0O+U4UQy55bOLwjMqp9wpg8sCwwc=; b=OSUKbhyHzsPUrrO58wHDVIcW9k
 EJO0tY4KTgpev+UE3zZkxaODOeHrOXRtN/icWuQbLFhJfHhPqxEUppJSEZqJXsH2FYtUHv/8XkEoZ
 vNw1HuhrqfCj0rlkglBjhwl2ruQBUmfNQzF7U9vsYdnXuvwUWxr+/QL648xBnh5hpnQw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9a7WpLfMa2pUk8U0O+U4UQy55bOLwjMqp9wpg8sCwwc=; b=fpfGFyOAjg/SJjzliZw7cjDYYZ
 SLQ4j9LVfmdhM//IrpP6O8UXYqDlUP1Xzp37CIp75UPGaysiZ8N4DPbxISHp2WnQUPAyNb6sn52Fu
 Vysu497Z9/qcHE/rVmLeg9s/+3klQ1sBuA8WZO9BFIiuhmx/akTIuAC1Sfzcxm6qfV3g=;
Received: from mail-lj1-f181.google.com ([209.85.208.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lOaIq-0003du-4i
 for kgdb-bugreport@lists.sourceforge.net; Tue, 23 Mar 2021 06:14:15 +0000
Received: by mail-lj1-f181.google.com with SMTP id z25so24093750lja.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Mar 2021 23:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9a7WpLfMa2pUk8U0O+U4UQy55bOLwjMqp9wpg8sCwwc=;
 b=ZUYjQ8HZYqvnzkDWkihzrDTJwFuJ2Yq41wGZeU7bkQuIAbTD3ggAZ7ELOJAeSC9M2g
 gu7ugP59zJupCQBu87rJq/beWbCd//MqrJgoncooJYkAK3Lv2xfUZ3DNIFjMK+XXwbva
 T0iXKjHVKlnCIQ/sYD8fYTLnWen549ARRW5N4kYuf6VVRnQIXVS8ECCiCy3TqRLsdbUo
 MS1vh9Ed8UEAv24wE66n+slCG8zsAi5wg73NImVr3P9wAbA7V/9qTt8OxJVRrE2SDd2F
 t+ytIPEhxZ+zfyN7VySbYjsODZSmDjoe3dXRYALuAZCAUsVYAkccGvGBfFgM78yTo1OV
 isdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9a7WpLfMa2pUk8U0O+U4UQy55bOLwjMqp9wpg8sCwwc=;
 b=IALZbfEokvOGqtukL7z807fe/NnnguiMggan5AR4Kecw/7utwBEvZ9kwGL3UufKxBY
 e7ay9YvTWY/rWZnNdW5R8eXCRTq087i8nEuzkTOUBF0aNCL3qIQqk9l4pgUCCrQLirfr
 cVWHbARFBzjUgSvwXU2MSwXeg9enIyMdGVpfOD7l0PeNaju2Hbpiw3GDJ3jspiCXbU1W
 dmRCiJ5g2S2lL6wPXhlJF9NTDl4TGQR3QfoyFW9synSFD8FJc3F82+O/KGnMtHR7XETY
 qRNSnu0g5ASKtcc82J0J3EOLh6CpMSIme4c/IT2BoCVUxfh7AdYOnlJhUMNyqMbznYr0
 Iiwg==
X-Gm-Message-State: AOAM530YrODph9TA6j2jXzmM/PW5klrhQGMtc0Xm15NxkY7taeMOWUj2
 APvlpb5L/uz6DzP16W9UfbSFXwibOuaAua5CA5VpFA==
X-Google-Smtp-Source: ABdhPJzgCv0B3NkvwBItBmsL0LNXiWLVViYVx8mESU339kCVlZZq9+aHBwIsMSn2pxo9rQWj7bsiGFoOsOBdi5Hlx+w=
X-Received: by 2002:a2e:5c47:: with SMTP id q68mr2104505ljb.314.1616480041484; 
 Mon, 22 Mar 2021 23:14:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210309121747.859823-1-sumit.garg@linaro.org>
 <20210319171712.vlkgnmp7cbnayxdn@maple.lan>
In-Reply-To: <20210319171712.vlkgnmp7cbnayxdn@maple.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 23 Mar 2021 11:43:50 +0530
Message-ID: <CAFA6WYMxUNwAB2sJBeS_Uvy0O43JqNPe_7-+ORGiHB7gBKjzYg@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.181 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.181 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lOaIq-0003du-4i
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Refactor kdb_defcmd implementation
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, 19 Mar 2021 at 22:47, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Tue, Mar 09, 2021 at 05:47:47PM +0530, Sumit Garg wrote:
> > Switch to use kdbtab_t instead of separate struct defcmd_set since
> > now we have kdb_register_table() to register pre-allocated kdb commands.
>
> This needs rewriting. I've been struggling for some time to figure out
> what it actually means means and how it related to the patch. I'm
> starting to conclude that this might not be my fault!
>

Okay.

>
> > Also, switch to use a linked list for sub-commands instead of dynamic
> > array which makes traversing the sub-commands list simpler.
>
> We can't call these things sub-commands! These days a sub-commands
> implies something like `git subcommand` and kdb doesn't have anything
> like that.
>

To me, defcmd_set implied that we are defining a kdb command which
will run a list of other kdb commands which I termed as sub-commands
here. But yes I agree with you that these don't resemble `git
subcommand`.

>
> > +struct kdb_subcmd {
> > +     char    *scmd_name;             /* Sub-command name */
> > +     struct  list_head list_node;    /* Sub-command node */
> > +};
> > +
> >  /* The KDB shell command table */
> >  typedef struct _kdbtab {
> >       char    *cmd_name;              /* Command name */
> > @@ -175,6 +181,7 @@ typedef struct _kdbtab {
> >       kdb_cmdflags_t cmd_flags;       /* Command behaviour flags */
> >       struct list_head list_node;     /* Command list */
> >       bool    is_dynamic;             /* Command table allocation type */
> > +     struct list_head kdb_scmds_head; /* Sub-commands list */
> >  } kdbtab_t;
>
> Perhaps this should be more like:
>
> struct defcmd_set {
>         kdbtab_t cmd;
>         struct list_head commands;
>
> };
>
> This still gets registers using kdb_register_table() but it keeps the
> macro code all in once place:
>
> kdb_register_table(&macro->cmd, 1);
>
> I think that is what I *meant* to suggest ;-) . It also avoids having to
> talk about sub-commands!

Okay, I will use this struct instead.

> BTW I'm open to giving defcmd_set a better name
> (kdb_macro?)
>

kdb_macro sounds more appropriate.

> but I don't see why we want to give all commands a macro
> list.

I am not sure if I follow you here but I think it's better to
distinguish between a normal kdb command and a kdb command which is a
super-set (or macro) representing a list of other kdb commands.

-Sumit

>
> Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
