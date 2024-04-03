Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E6789775E
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  3 Apr 2024 19:52:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rs4n7-0002AT-Gk
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 03 Apr 2024 17:52:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <justinstitt@google.com>) id 1rs4n4-0002AJ-Pd
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 03 Apr 2024 17:52:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JqrURadVh6bfrB2uLbLqnbQWG9RW9Mp6NnYEctBPd/0=; b=LsvL9Eelg/B3+2jWtJ4LkRHfX+
 4DWnVKkQbzAb+3i+joVgbxT1oxJesyysGtJVCTxADRAZLJL35yPNJwFAO0G1UIw5p/gAvAJy05Mx/
 +WUo8WXYP+JhbEpcHTIbCwRVngUMYhLrZRL8TNDrpg4J72MEBWF8UHiafcHnB1KM/6TI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JqrURadVh6bfrB2uLbLqnbQWG9RW9Mp6NnYEctBPd/0=; b=Lad+fVkokVz7ZWaEGv1WU3x6h/
 FLwr/GEpVrI3bBdv7avvpCzjnXKT9fvGhO1UYmFKKhVaiFNxaKrhWrGZArJUDgr7GNVunjFyinDoj
 RmXgfWXTQlEPeY0vIXCVotmDABVsHcksuFYnRwybMvGmkXIQYWgHvrMvqM0p6Lc3HL0M=;
Received: from mail-lf1-f52.google.com ([209.85.167.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rs4mz-0001AF-Kv for kgdb-bugreport@lists.sourceforge.net;
 Wed, 03 Apr 2024 17:52:50 +0000
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-516c116f480so128061e87.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 03 Apr 2024 10:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1712166759; x=1712771559;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JqrURadVh6bfrB2uLbLqnbQWG9RW9Mp6NnYEctBPd/0=;
 b=KJpnuVfZwh/xuaxmadEJerE5DUYedFkJ3+SG/+7Qzgzqw+Wn3BZmmZPxzyqF7Ztvbt
 1Bgjf+kZp2jZBk3JTuD9WIgt0T8MMhcZKXnAvrUvbwVDBa0BpqNN6vM+79rR9mfG0mZu
 7F2v5EpNSQw4JS87Q0JFYeRrEJnEIdlHMR6ssb4hltjNpjbEa/fEzwIT0KbrXyh4AibO
 hjx3CWERza58XsqWo2E4pB0G2nd18l4GtXq/JQV67h1P2VuqxK2eu0N/1NuXBhHJLeMW
 DOYIWO27Mjg8E2pA+pNNVw0kPk2XcCnQImC2eLu4QhPrwaSUYKV/dBFgQuwbv/P+uFqp
 0c6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712166759; x=1712771559;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JqrURadVh6bfrB2uLbLqnbQWG9RW9Mp6NnYEctBPd/0=;
 b=RBbRSoYL2T1RIzAalhhMv+HuAZR4lJjmpOdV2XPWbLf77321lwTZoCYtfS3byE9G/Y
 QkyDIEELjfmAEUO5nWZ8HqhQir/3ItQv4p+27wZPFqmWp16J6XrTmFUnpqUDp7to/Cq/
 g3xDDmokErP4Gkpv8L58BFthgKz/wQhIAmieexyq+nqbTiT0s1KxWRObGraROmnZ6Z0X
 w9oTZ9+wcAderYSVLx3esTyP3pz60yOVaXFONax3XhddRDoy/0I3B9S4GSv86xX0wdHx
 SZzw6yIwmrO0QJqO2Y7rKx7Yo3VfodzrQ8ksheBSdRrnzFX26W0V+HFWQd5XsCtxOm6N
 P4ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOFjf+QR89x5pZgn9aKoeQCYvHP2rodsgmoA2cwZgESg1zuFBq8QmLHP6lUQF3obi7aAJhQuQZfixV2ImUgQoH8OPDytcHT9mhV2SsHvc1oIf3bdc=
X-Gm-Message-State: AOJu0Yx+uE2NvXZ8rp3Nbp6qJ1X75JbId8FKmHlZdVTt1W5GL1hJLHF8
 9QXoCVFqZ2uGGhBEepnuZBPSOAwkuxTNf4520WLTdOpo4Tm4IWgZZBaOFKihthCcfhX+tf1P/93
 LyPO1l3x3he6K/Rx5eYNrDYrN0499dkvGtGYEBCDxlAg64ePoJgYc
X-Google-Smtp-Source: AGHT+IGSZh3cGZaqkR61KLJvDstkfMIgQgaXFfkZwJhOF9eaxuv59oIjbf/wbWZywUuB5lPZKadWGDHsD804an1EBCw=
X-Received: by 2002:a17:906:aadb:b0:a4d:ffcb:1f4e with SMTP id
 kt27-20020a170906aadb00b00a4dffcb1f4emr11402ejb.75.1712166423477; Wed, 03 Apr
 2024 10:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240403-strncpy-kernel-debug-kdb-kdb_io-c-v1-1-7f78a08e9ff4@google.com>
 <20240403112336.GD25200@aspen.lan>
In-Reply-To: <20240403112336.GD25200@aspen.lan>
Date: Wed, 3 Apr 2024 10:46:50 -0700
Message-ID: <CAFhGd8rjDRTY8JjWx_zt8xBHGcJYzp5VpFf_sN+s-kRcr1JKBw@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed, Apr 3, 2024 at 4:23 AM Daniel Thompson <daniel.thompson@linaro.org>
    wrote: > > - strncpy(cp, p_tmp+len, len_tmp-len + 1); > > + memcpy(cp, p_tmp+len,
    len_tmp-len + 1); > > Roughly the same q [...] 
 
 Content analysis details:   (-15.7 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
                             welcome-list
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
                             welcome-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.52 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.52 listed in wl.mailspike.net]
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
                             Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1rs4mz-0001AF-Kv
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: replace deprecated strncpy
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
From: Justin Stitt via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Justin Stitt <justinstitt@google.com>
Cc: kgdb-bugreport@lists.sourceforge.net, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gV2VkLCBBcHIgMywgMjAyNCBhdCA0OjIz4oCvQU0gRGFuaWVsIFRob21wc29uCjxkYW5pZWwu
dGhvbXBzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgc3Ry
bmNweShjcCwgcF90bXArbGVuLCBsZW5fdG1wLWxlbiArIDEpOwo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIG1lbWNweShjcCwgcF90bXArbGVuLCBsZW5fdG1wLWxlbiArIDEpOwo+Cj4gUm91Z2hs
eSB0aGUgc2FtZSBxdWVzdGlvbiBoZXJlLiBUaGUgb3JpZ2luYWwgY29kZWQgaXMgb2J2aW91c2x5
IHdyb25nCj4gc28gdHJ1c3RpbmcgaXQgZGlkIHRoZSBib3VuZGFyeSBjaGVja3MgcHJvcGVybHkg
c2VlbXMgdW53aXNlLgo+Cj4gQXJlIHlvdSBzdXJlIGl0IGlzIE9LIHRvIG1ha2UgdGhpcyBjb3B5
IHdpdGggY2hlY2tpbmcgYWdhaW5zdCBidWZlbmQ/Cj4KCkkgYW0gZ29pbmcgdG8gcmV2aXNpdCB0
aGlzIGFuZCBmaW5kIGEgYmV0dGVyIHNvbHV0aW9uLiBUaGFua3MgRGFuaWVsLgoKPgo+IERhbmll
bC4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2Ri
LWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVn
cmVwb3J0Cg==
