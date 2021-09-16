Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B02740E1BB
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Sep 2021 18:58:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1mQuiJ-0002VN-7i
	for lists+kgdb-bugreport@lfdr.de; Thu, 16 Sep 2021 16:58:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1mQuiI-0002VH-2o
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Sep 2021 16:58:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IGawo7qHdYJ6pDlqSWrZJzU7pFqydq2lO0Epdt4VQzw=; b=nEJ4AlFVIPwI0i9IFnfYU1zKIt
 GyjQ/F7H7y16QEKeabJpx32GmW3Qyvt9yHADsWhGgH7dzFjPKKv68XWHKk31hp+WY+7gpAW4iXE3h
 tK+RxNE/vlI28b2Hbz7tou5NtXopDDkijnIqrIg/kybGg5Vaqj6A95Scqwp6c8/P5QvY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IGawo7qHdYJ6pDlqSWrZJzU7pFqydq2lO0Epdt4VQzw=; b=HpRrT1H9oRvjt7nRZPyWZLfHp5
 Ep7kXv4TJyui5I3WIAa6NeOv8B9iOGTxiHDr65D3B2jl/QRuR8pneLzQofYiImF0IQV62VfFZLoDU
 YVtAvXLps/MY60jRTquUOeJnW+evg9P8qG3fHjwiWgUORgK+Z9RdMVXZpvfbOJpNgYhA=;
Received: from mail-il1-f173.google.com ([209.85.166.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mQuiH-0002u0-DG
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Sep 2021 16:58:18 +0000
Received: by mail-il1-f173.google.com with SMTP id x2so7253813ila.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 16 Sep 2021 09:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IGawo7qHdYJ6pDlqSWrZJzU7pFqydq2lO0Epdt4VQzw=;
 b=UdjgxAu0WzP8hlYxhK5Q5mSYYPA5I/3WpDrkEFnZYswXjZJw+MQ+U9sNTA5obFhKBM
 GdkzA4dBTAVghkCuWqLbClYfMWZc7vRdsXCZP2fpok8YZkQleFpkdLpFvIqu25NY42p4
 VvS9hzKv4Fmjb62G0WVhWWAE6AbYpalmX5n7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IGawo7qHdYJ6pDlqSWrZJzU7pFqydq2lO0Epdt4VQzw=;
 b=uwrFmSW1ct0eZ9mNMYFTfugbs/K16HUdCFRsqUIy6tLWSVMHlXc/r8Z6AOaC2X6QB9
 sBKsJRtM5dDXalC8DeCDMOfzL0u8KqweJJQaEstRfIGRuGJCnNioNuIk2zVbz9B5jZdF
 Tp9xvdlGi2oM/U85VmaRGb6Cy6Lcc/PieLuMBCYnbLY+aB4Hwnu66YzHNXT4WlwAB+S9
 D+hodi1GdehaUdqgjd6C6Wk+77HmaaP0r16LfvRo54InoSfOIgjrRBbFSlGASsh7989f
 cvNbQ/1Rhsa1w9NhKwCW58mHUmemkC15FzqDJqQEcQJFi2eElrXZbQYBbLmkcbcIvAUk
 hN6A==
X-Gm-Message-State: AOAM532+wTU9FearQ7/1kMgeZ7ayGaBt98/G6aPn106RAlf8qOJ15BCF
 j93rEPfEVTo4FeQrErfP8SU/s6rNSdb2Vw==
X-Google-Smtp-Source: ABdhPJzyXByhhO23nyEo4118j1Ueno4MpejWnNrudKN4gDRXVwxOhVUtzcWDIohOqMliUp7q3jB46w==
X-Received: by 2002:a5d:8a0e:: with SMTP id w14mr4995931iod.94.1631809715112; 
 Thu, 16 Sep 2021 09:28:35 -0700 (PDT)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com.
 [209.85.166.172])
 by smtp.gmail.com with ESMTPSA id d10sm2117227ilu.54.2021.09.16.09.28.34
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 09:28:34 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id w1so7238177ilv.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 16 Sep 2021 09:28:34 -0700 (PDT)
X-Received: by 2002:a05:6e02:1bad:: with SMTP id
 n13mr2439109ili.142.1631809714033; 
 Thu, 16 Sep 2021 09:28:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210916154253.2731609-1-daniel.thompson@linaro.org>
In-Reply-To: <20210916154253.2731609-1-daniel.thompson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 16 Sep 2021 09:28:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xri+J2=iQzCHLxB+ksT41V6Rexp+BXWi6Fe7=jq3oTFg@mail.gmail.com>
Message-ID: <CAD=FV=Xri+J2=iQzCHLxB+ksT41V6Rexp+BXWi6Fe7=jq3oTFg@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Thu, Sep 16,
 2021 at 8:43 AM Daniel Thompson <daniel.thompson@linaro.org>
 wrote: > > Currently kdb contains some open-coded routines to generate a
 summary > character for each task. This code curre [...] 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.173 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.173 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mQuiH-0002u0-DG
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Adopt scheduler's task
 clasification
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
Cc: Xiang wangx <wangxiang@cdjrlc.com>,
 jing yangyang <jing.yangyang@zte.com.cn>, kgdb-bugreport@lists.sourceforge.net,
 Patch Tracking <patches@linaro.org>, LKML <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Thu, Sep 16, 2021 at 8:43 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> Currently kdb contains some open-coded routines to generate a summary
> character for each task. This code currently issues warnings, is
> almost certainly broken and won't make any sense to any kernel dev who
> has ever used /proc to examine tasks (D means uninterruptible?).
>
> Fix both the warning and the potential for confusion but adopting the
> scheduler's task clasification. Whilst doing this we also simplify the

s/clasification/classification/


> filtering by using mask strings directly (this means we don't have to
> guess all the characters the scheduler might give us).
>
> Unfortunately we can't quite adopt the scheudler classification it in

s/scheudler/scheduler/


> its entirity because, whilst we can tolerate some changes to the filter

s/entirity/entirety/


> characters, we need to keep I as a means to identify idle CPUs rather than
> system daemons that don't contribute to the load average! Naturally there
> is quite a large comment discussing this.

I'm a bit curious why we're OK with changing other characters but not
'I'. Even if the scheduler use of the character 'I' is a bit
confusing, it still seems like it might be nice to match it just to
avoid confusion. Couldn't we use lowercase 'i' for idle CPUs?
Alternatively beef up the commit message justifying why exactly we
need to keep 'I' as-is.


> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>

Worth having a "Fixes" for the patch that introduced the warning?


> @@ -74,7 +74,7 @@ static void kdb_show_stack(struct task_struct *p, void *addr)
>   */
>
>  static int
> -kdb_bt1(struct task_struct *p, unsigned long mask, bool btaprompt)
> +kdb_bt1(struct task_struct *p, const char *mask, bool btaprompt)

In the comment above this function there is still a reference to
"DRSTCZEUIMA". Update that?


> @@ -2300,7 +2298,7 @@ void kdb_ps_suppressed(void)
>  /*
>   * kdb_ps - This function implements the 'ps' command which shows a
>   *     list of the active processes.
> - *             ps [DRSTCZEUIMA]   All processes, optionally filtered by state
> + *             ps [RSDTtXZPIMA]   All processes, optionally filtered by state

What about "U"? What about "E"?


> @@ -2742,7 +2741,7 @@ static kdbtab_t maintab[] = {
>         },
>         {       .name = "bta",
>                 .func = kdb_bt,
> -               .usage = "[D|R|S|T|C|Z|E|U|I|M|A]",
> +               .usage = "[R|S|D|T|t|X|Z|P|I|M|A]",

What about "U"? What about "E"?


> @@ -559,7 +484,6 @@ unsigned long kdb_task_state_string(const char *s)
>   */
>  char kdb_task_state_char (const struct task_struct *p)
>  {
> -       unsigned int p_state;
>         unsigned long tmp;
>         char state;
>         int cpu;
> @@ -568,16 +492,20 @@ char kdb_task_state_char (const struct task_struct *p)
>             copy_from_kernel_nofault(&tmp, (char *)p, sizeof(unsigned long)))
>                 return 'E';
>
> -       cpu = kdb_process_cpu(p);

Don't you still need this? You still have the `cpu` variable and you
still use it in the idle task case.


> -       p_state = READ_ONCE(p->__state);
> -       state = (p_state == 0) ? 'R' :
> -               (p_state < 0) ? 'U' :
> -               (p_state & TASK_UNINTERRUPTIBLE) ? 'D' :
> -               (p_state & TASK_STOPPED) ? 'T' :
> -               (p_state & TASK_TRACED) ? 'C' :
> -               (p->exit_state & EXIT_ZOMBIE) ? 'Z' :
> -               (p->exit_state & EXIT_DEAD) ? 'E' :
> -               (p_state & TASK_INTERRUPTIBLE) ? 'S' : '?';
> +       state = task_state_to_char((struct task_struct *) p);

Casting away constness is fine for now and likely makes this easier to
land, but maybe you can send a patch up to change the API to have
"const" in it?


-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
