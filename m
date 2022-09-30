Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 863AF5F0D77
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 30 Sep 2022 16:24:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1oeGw8-0008Rx-IO
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 30 Sep 2022 14:24:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1oeGw6-0008Re-KK
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 30 Sep 2022 14:24:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VwNQ7+2ua16Xcezf7uX5/OiXV8isJNe+JovjKGf9FvY=; b=NSRITBcdMCtuJk1EREe+2YnwJU
 /pajsZVeNGV1TKBeMyXUIES/S0jQz3dMuximDUWCfQb5id6usVd6lRCDriadlwnxHurssWj8eWrK3
 XxkQzVXqsVyqHo7gaMDBwd861YXUT7oPA78HQEjOFrS7NeXHoPxu5iN65Dv8oAUxPFAY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VwNQ7+2ua16Xcezf7uX5/OiXV8isJNe+JovjKGf9FvY=; b=Kkz8+LxoOWfdS/UIulaouG3jZ/
 gRrcMzq0svlogefHoIYHdj86reK/amGIPdusDCkHjyvYVf4GM+2AmrH2zrI+9GP7/LHmwB4Ch8i6O
 lcjZuzY7kjE6bHoqhCMgQ6v2UWrNlcXTbEv06csdy3GzJJnQYN5ZMoLL/RvJFRv39fXI=;
Received: from mail-ed1-f49.google.com ([209.85.208.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oeGw5-0001Yi-VS for kgdb-bugreport@lists.sourceforge.net;
 Fri, 30 Sep 2022 14:24:18 +0000
Received: by mail-ed1-f49.google.com with SMTP id c30so6206963edn.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 30 Sep 2022 07:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=VwNQ7+2ua16Xcezf7uX5/OiXV8isJNe+JovjKGf9FvY=;
 b=hl9i90bcLZEk70jdX3jQ5moL2FHbU+7F36Pd1jeWoUNiOvxSexA51qnUdtDpfuJNL6
 lgi7QemszzqznIfQl9bWyojo4yamR5K3OKT+25iQwp3tBhGSZkRyOP3erCKgmetqxhUr
 pqAo48rnKIPXH+JjHwZZWEapdJOpuxUqPiM4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=VwNQ7+2ua16Xcezf7uX5/OiXV8isJNe+JovjKGf9FvY=;
 b=Q7qpgF0T3oLNWsFzX9L4Kh2NPMIVf4e6XEkMCoZpJZcbzb+xQKdRz8EQMo6zupCnyt
 b4cohURbRO8lb35mgFo8NOJjAC+/0v8A5ZJzgJyECW8FnRTMuXGhnvIf+VkIddUrgL5Y
 +/TKHaOjJ+LxFRXeVdgW+STlLRR5VmTnWMEp7xlX1400Sr42V9T9UASM5kPoaNhfK+Ba
 QtlgYYhvOckHuyTYlj1+T5hzCbZ1UMB4raQKLLDEiXj9C8XhvxdD3CBzBCIT5lsXWrFh
 yWoOvUs5y3bxhLoOz8DXYI6JZ5A761ZBZx67aRKndjIIRulfoqq/TnxljHMsiiubQpBs
 VFLQ==
X-Gm-Message-State: ACrzQf0WNOJMG65HrdwV3HhTvB0/YA7+1tCbeeVIJKnQ9KixpXqcJAgx
 GLsoAOIUGCpW3byix8VTAJcAJuddzOohSok8
X-Google-Smtp-Source: AMsMyM5LBySSE4fwJN63t6ZbmvK3K1C3oJEgmYOYCGY2HhNIitoMu2c7fBpAMt3Tfcqc/TR0PvNUfw==
X-Received: by 2002:aa7:c849:0:b0:453:9543:6ef3 with SMTP id
 g9-20020aa7c849000000b0045395436ef3mr8048290edt.105.1664547851301; 
 Fri, 30 Sep 2022 07:24:11 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44]) by smtp.gmail.com with ESMTPSA id
 l3-20020a170906644300b0077a201f6d1esm1261698ejn.87.2022.09.30.07.24.10
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 07:24:10 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id x18so7131904wrm.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 30 Sep 2022 07:24:10 -0700 (PDT)
X-Received: by 2002:a5d:522f:0:b0:228:dc7f:b9a8 with SMTP id
 i15-20020a5d522f000000b00228dc7fb9a8mr6150906wra.617.1664547850437; Fri, 30
 Sep 2022 07:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAL2OxujDSaiGmQA+htbRrKVznKOhcX_C4oYd951ROScMnAV8wA@mail.gmail.com>
In-Reply-To: <CAL2OxujDSaiGmQA+htbRrKVznKOhcX_C4oYd951ROScMnAV8wA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 30 Sep 2022 07:23:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V_041NcyXqg8o8+x+9uVkS8FLwcGoUiHX4L+Lq+m_bpA@mail.gmail.com>
Message-ID: <CAD=FV=V_041NcyXqg8o8+x+9uVkS8FLwcGoUiHX4L+Lq+m_bpA@mail.gmail.com>
To: arden jay <arden.jay@gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Thu, Sep 29,
 2022 at 11:34 PM arden jay <arden.jay@gmail.com>
 wrote: > > Hi, > > In ARM64, kdb "ss" always keeps the same pc. For example,
 > > Entering kdb (current=0xffff0000c0240e40, pid 188) on [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.49 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.49 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oeGw5-0001Yi-VS
Subject: Re: [Kgdb-bugreport] single step
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
Cc: kgdb-bugreport@lists.sourceforge.net, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Thu, Sep 29, 2022 at 11:34 PM arden jay <arden.jay@gmail.com> wrote:
>
> Hi,
>
> In ARM64, kdb "ss" always keeps the same pc. For example,
>
> Entering kdb (current=0xffff0000c0240e40, pid 188) on processor 0 due to SS
> trap @ 0xffff800010011c84
> [0]kdb> ss
>
> Entering kdb (current=0xffff0000c0240e40, pid 188) on processor 0 due to SS
> trap @ 0xffff800010011c84
>
> From the code, kgdb_arch_update_addr won't update the pc if it is not
> compiled_break. Shouldn't "ss" single step to the next instruction?
>
> Do I miss something?

No. Single step on arm64 is simply broken. See:

https://lore.kernel.org/r/20220511060521.465744-1-sumit.garg@linaro.org

The latest news is that we're waiting for Will to have time to look at
Sumit's patches and either bless them or suggest something different.

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
