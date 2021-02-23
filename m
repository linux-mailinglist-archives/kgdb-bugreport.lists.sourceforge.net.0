Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F9A322E62
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 23 Feb 2021 17:09:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lEaFm-0001Hz-UX
	for lists+kgdb-bugreport@lfdr.de; Tue, 23 Feb 2021 16:09:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1lEaFl-0001Hf-Pa
 for kgdb-bugreport@lists.sourceforge.net; Tue, 23 Feb 2021 16:09:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aBg1IR5JedpOTOrYO06K6DlJUVlqWpH8omy4Ybzar+8=; b=aDJHor1r9HYadHzq7Hi/6Mi/8S
 MYlmOW6YNR0pBmulEXBMstZfDx4SNt5qmzJUOKthIF0jqZC9/coZ5guFp62kd46K7wJptQkbD2VvM
 LBJmNPGusvpJXPD0XSYr82XdEE4v4FdyruK1YFdGjJVmNyomqKYDjfAFDxyhiyX7Wq3A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aBg1IR5JedpOTOrYO06K6DlJUVlqWpH8omy4Ybzar+8=; b=PBiUGkBZhnYVSA3urhvL2tLezp
 AWZsqdebqs1CEi41Bh6G0JuAOlMGUq3qVHrLBpb+ir8Ih0MiSLEfjO0eknuTgVI/n5jrDGbvfiAn7
 3h+BUvuQnvRkvFn94GrohKW3SW/l6z5/crXjUneJG97uL5iEvi3+/yi7mfMeJl5hQqqM=;
Received: from mail-qv1-f48.google.com ([209.85.219.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lEaFf-0002U9-Nd
 for kgdb-bugreport@lists.sourceforge.net; Tue, 23 Feb 2021 16:09:37 +0000
Received: by mail-qv1-f48.google.com with SMTP id p12so7999122qvv.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 23 Feb 2021 08:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aBg1IR5JedpOTOrYO06K6DlJUVlqWpH8omy4Ybzar+8=;
 b=m0zKw9YMqnels88qhtZuB8ptwcMEcFktaV383ohgB6ToB1fno6GsAzPAlkrp3GW54H
 Qw6XrXiQn98GVfR0PlSmeBISxq+3mbZ6iOZvZJmSimBBaCOjm/mu+4jBhPjflxbycyO5
 OK6/c86p5YbIE+7J5XDfYIwczh/hoNDS/3MXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aBg1IR5JedpOTOrYO06K6DlJUVlqWpH8omy4Ybzar+8=;
 b=ozCsuMI0tUuA4v4BU/+8OauxzsXqDkLHB50EmdH9L9eLM/4IZoJzEQVbq13s+ILOXf
 Oav6W6AcTBe8tgF+fqcgDTEhQ+s7oAMKz+Ll+UE+NJdEI5YZAQ5wCeo9hR9JqKbbJhSe
 D277tMZSq8bDIxmHJaAY+NLRQ1FqAZPDgnpqiwRq7YVCX52KxRcckJ7asRUxTPUvq40K
 S1iOldPgifJmgfJPsxuxd3pMJwcBUD1UEqPI+h2m7SQkG2c0tfeaX89Ua/OAoRtpwh/9
 49eW8mM5USyoJqveUG5pIWrWDTSHx9lR6eyySy0yF45Um28t9BZYlw/eDgnb4VYyTwSJ
 j8rw==
X-Gm-Message-State: AOAM530TCY473iu1yobtuVmpY55uSwFq3m12K3CCWGdFjFMYESgTsc1S
 RmG0NXCaD7VDomQ4M5b+DKY3IBRtHAHNaw==
X-Google-Smtp-Source: ABdhPJxGWdDoLIbkC8rEOOdtTZf90XNWU9g9GGkFNeZSnWcory/I3fpYFFeAigS+YRG9y/+qXZP36A==
X-Received: by 2002:a0c:eb0f:: with SMTP id j15mr13059313qvp.58.1614096565663; 
 Tue, 23 Feb 2021 08:09:25 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172])
 by smtp.gmail.com with ESMTPSA id u4sm15217596qkc.42.2021.02.23.08.09.25
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 08:09:25 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id p186so17031144ybg.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 23 Feb 2021 08:09:25 -0800 (PST)
X-Received: by 2002:a25:b74d:: with SMTP id e13mr41178295ybm.405.1614096564853; 
 Tue, 23 Feb 2021 08:09:24 -0800 (PST)
MIME-Version: 1.0
References: <20210223120045.153208-1-sumit.garg@linaro.org>
In-Reply-To: <20210223120045.153208-1-sumit.garg@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 23 Feb 2021 08:09:13 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XXRkgC7XzM4Zu9so4=-KgXyXrLSXURj4uoEDPUOuAsoQ@mail.gmail.com>
Message-ID: <CAD=FV=XXRkgC7XzM4Zu9so4=-KgXyXrLSXURj4uoEDPUOuAsoQ@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.48 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.48 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lEaFf-0002U9-Nd
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Remove redundant function
 definitions/prototypes
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
 Daniel Thompson <daniel.thompson@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Tue, Feb 23, 2021 at 4:01 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> @@ -103,7 +103,6 @@ extern int kdb_getword(unsigned long *, unsigned long, size_t);
>  extern int kdb_putword(unsigned long, unsigned long, size_t);
>
>  extern int kdbgetularg(const char *, unsigned long *);
> -extern int kdbgetu64arg(const char *, u64 *);

IMO you should leave kdbgetu64arg() the way it was.  It is symmetric
to all of the other similar functions and even if there are no
external users of kdbgetu64arg() now it seems like it makes sense to
keep it matching.


> @@ -209,9 +208,7 @@ extern unsigned long kdb_task_state(const struct task_struct *p,
>                                     unsigned long mask);
>  extern void kdb_ps_suppressed(void);
>  extern void kdb_ps1(const struct task_struct *p);
> -extern void kdb_print_nameval(const char *name, unsigned long val);
>  extern void kdb_send_sig(struct task_struct *p, int sig);
> -extern void kdb_meminfo_proc_show(void);

Getting rid of kdb_print_nameval() / kdb_meminfo_proc_show() makes sense to me.


>  extern char kdb_getchar(void);
>  extern char *kdb_getstr(char *, size_t, const char *);
>  extern void kdb_gdb_state_pass(char *buf);
> diff --git a/kernel/debug/kdb/kdb_support.c b/kernel/debug/kdb/kdb_support.c
> index 6226502ce049..b59aad1f0b55 100644
> --- a/kernel/debug/kdb/kdb_support.c
> +++ b/kernel/debug/kdb/kdb_support.c
> @@ -665,24 +665,6 @@ unsigned long kdb_task_state(const struct task_struct *p, unsigned long mask)
>         return (mask & kdb_task_state_string(state)) != 0;
>  }
>
> -/*
> - * kdb_print_nameval - Print a name and its value, converting the
> - *     value to a symbol lookup if possible.
> - * Inputs:
> - *     name    field name to print
> - *     val     value of field
> - */
> -void kdb_print_nameval(const char *name, unsigned long val)
> -{
> -       kdb_symtab_t symtab;
> -       kdb_printf("  %-11.11s ", name);
> -       if (kdbnearsym(val, &symtab))
> -               kdb_symbol_print(val, &symtab,
> -                                KDB_SP_VALUE|KDB_SP_SYMSIZE|KDB_SP_NEWLINE);
> -       else
> -               kdb_printf("0x%lx\n", val);
> -}
> -

Getting rid of kdb_print_nameval() makes sense to me.

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
