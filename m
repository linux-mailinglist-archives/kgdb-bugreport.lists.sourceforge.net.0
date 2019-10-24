Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C76E2D17
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 24 Oct 2019 11:20:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iNZIP-0003yn-Je
	for lists+kgdb-bugreport@lfdr.de; Thu, 24 Oct 2019 09:20:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <axboe@kernel.dk>) id 1iNUMQ-0001xC-Pp
 for kgdb-bugreport@lists.sourceforge.net; Thu, 24 Oct 2019 04:04:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W8sgLGjMxM6EuY1mpsS+9Tn33OqsmcrGz0uhv99VAHA=; b=C4FtI/SGTKIzWhsrdkILiaz7Nd
 O9LnBFVc5irXN6dEmZY07NeeR8GbhIE2LvpKJqR6FyF7eXgh00pAiC//Sk5F12LDG3hop+BgEHw74
 uEt/H/Z6tyLx7TVQgEsySaT3yjmczMO7T1m9Qc6f0ZTLyU/kZN95IUur4aBX0vO4wXm4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W8sgLGjMxM6EuY1mpsS+9Tn33OqsmcrGz0uhv99VAHA=; b=Wq4CT7AF5HemCC5ujhs3nSXf+I
 xUMMlLzj+yhUCpkl7EfZFj945tME+LnMU1ImLTNqruT1r/pS/APLjbyV5CCOC1lrqPWaX9/Yti/ZN
 jwpPBpoUcnyBWy/TzDRYViZ8CO1TgsqX+yC5eALtgiVL4f5f+WMxQzqpVg8BwPq4oxzk=;
Received: from mail-pl1-f194.google.com ([209.85.214.194])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iNUMN-0016Kw-5J
 for kgdb-bugreport@lists.sourceforge.net; Thu, 24 Oct 2019 04:04:30 +0000
Received: by mail-pl1-f194.google.com with SMTP id t10so11160296plr.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 23 Oct 2019 21:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W8sgLGjMxM6EuY1mpsS+9Tn33OqsmcrGz0uhv99VAHA=;
 b=T2bbeZtvsO039PfGe+EjPR125EqRdU9mKD894GYoR0zBnNNVcSR1u3DGiXZFKGUrwF
 Q1L4mEl5u7aBDGEgAvXjkzTOXSSGhbHMY7JwyTtpuA/1lUXfeioaDSSD5DwpPF81FKT1
 ajJMYUZOWHJQq3Czs4YHreOwy2CVWx9lD7yEqbXak5+nnWYpgJsNSp3cviar/kEx8g3A
 JL2eoJFhv69W7IpzFJO3QBiRSBRWpD2PYo0i6gZ0SVVJGOTgtJG3panMDXQqq/fdjcQQ
 JYHL/HihPBR2U1KB50B+TI1h2RA9YPd7A7tX1ZQWp7kanwYzwZ3TCAZYt7pKgxi2zf4H
 C+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W8sgLGjMxM6EuY1mpsS+9Tn33OqsmcrGz0uhv99VAHA=;
 b=rlMP+aSKXLOM72ke+t2hx8aSeeWflVGZ+Oqgnd1CzhUQMstzi4OKAJHr1aoeDluMum
 EUw7mqJFwFat5wM2QowGeRmCanFw5jMveswL0kdJIVt8f0NTClt2xhm2WQa5yALp8Wer
 1uAf9bMahHyj/OG6wz1wpMjofMJYJFUMRZwftvcbGyWk+cIxv6/QlKk+iit0H9uh2T4X
 LJGitgStkFaTl4uhpJu6nS4U0xhQpEiWQnCMZfcrD7VPt8ab5cT3rI1n3Xw+xsCUBXEx
 Gs5XdGo0YQ/gyIjewHBOZbOKUBL+3tjLARVcpq7ODMK7uRUU83F+q9t0ZWUSYr+zmDGT
 mVRQ==
X-Gm-Message-State: APjAAAUq04h91GjZdsKQ0z5uD3LuIT9WSjVGq+r7my353wLmxQfh89rp
 +oH6Gb/ASBG93BL3icN31j739CZe264C7w==
X-Google-Smtp-Source: APXvYqzjuWYGP5CVydefv3aAYM4Zf7GeakbWEIFeuKC0sgKLKckuazE4qo+gNK3oOsra0rup9w7uiQ==
X-Received: by 2002:a17:902:968f:: with SMTP id
 n15mr13304176plp.191.1571888344349; 
 Wed, 23 Oct 2019 20:39:04 -0700 (PDT)
Received: from [192.168.1.188] ([66.219.217.79])
 by smtp.gmail.com with ESMTPSA id b17sm9759144pfr.17.2019.10.23.20.39.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Oct 2019 20:39:03 -0700 (PDT)
To: Joe Perches <joe@perches.com>, Daniel Thompson <daniel.thompson@linaro.org>
References: <f31b38b9ad515a138edaecf85701b1e3db064114.camel@perches.com>
 <20191021090909.yjyed4qodjjcioqc@holly.lan>
 <bff0a1c4fc69b83c763ffbce42a0152e1573499a.camel@perches.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <2808c960-6178-17b8-23d7-a6945987a658@kernel.dk>
Date: Wed, 23 Oct 2019 21:39:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <bff0a1c4fc69b83c763ffbce42a0152e1573499a.camel@perches.com>
Content-Language: en-US
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: perches.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.194 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iNUMN-0016Kw-5J
X-Mailman-Approved-At: Thu, 24 Oct 2019 09:20:39 +0000
Subject: Re: [Kgdb-bugreport] [PATCH] kernel: convert switch/case
 fallthrough comments to fallthrough; 
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
Cc: linux-pm@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-audit@redhat.com,
 netdev@vger.kernel.org, bpf@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 10/23/19 12:49 PM, Joe Perches wrote:
> On Mon, 2019-10-21 at 10:09 +0100, Daniel Thompson wrote:
>> On Fri, Oct 18, 2019 at 09:35:08AM -0700, Joe Perches wrote:
>>> Use the new pseudo keyword "fallthrough;" and not the
>>> various /* fallthrough */ style comments.
>>>
>>> Signed-off-by: Joe Perches <joe@perches.com>
>>> ---
>>>
>>> This is a single patch for the kernel/ source tree,
>>> which would otherwise be sent through as separate
>>> patches to 19 maintainer sections.
>>
>> For the kernel/debug/ files:
>>
>> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
>>
>> Will you be putting this in an immutable branch once you've collected
>> enough acks?
> 
> No, I expect Linus will either run the script
> or apply this patch one day.

Please coordinate and get something like this run/applied a few days
before -rc1 to cause the least amount of needless merge issues.

-- 
Jens Axboe



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
