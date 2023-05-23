Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D36B770E1D7
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 23 May 2023 18:35:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q1UyR-0004Ej-KR
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 23 May 2023 16:34:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q1UyQ-0004Ed-3P
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 23 May 2023 16:34:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7BQXLdFOI2CGu/rfEBqigmE78qgmnNYZiqsFoyv3xq0=; b=bufhFJv0hqdxgvvPtEvGhX8+nM
 dz0rIGlW9QtmhaUP2VfPGw7SfxRyjL6BatmE2/6bYaj1u/ZhCGd80osZxAFPpTJ/z/WY+oPPWjjiO
 hsrx3SEto3/5CZ3HLBgax+zI8mRADEVcN1QI0OIalr/QfuMHJmo4jNw8NLepzM7aQV2U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7BQXLdFOI2CGu/rfEBqigmE78qgmnNYZiqsFoyv3xq0=; b=RSXG8AlzEEcifBIOkxBkvTwdr0
 +f15A3oaM7vtbUYoyRlV+pc/ahWFiboVXfsSZJ1DW1RYxEXHadeu2eVifomYSX+8A0TSUVc89zUTl
 xSzuF8z5CCI8jt6soMmVQLFLsvvwnAUvuQsmlh3Cl8+XoAn5xtdhtVZ06+RjFW9v/a9Y=;
Received: from mail-io1-f50.google.com ([209.85.166.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q1UyO-0007Ay-Te for kgdb-bugreport@lists.sourceforge.net;
 Tue, 23 May 2023 16:34:58 +0000
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-7747df5b674so104820839f.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 23 May 2023 09:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684859690; x=1687451690;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7BQXLdFOI2CGu/rfEBqigmE78qgmnNYZiqsFoyv3xq0=;
 b=c/8i38NYg0YOutxdUJzNmQ9O6KQv7sx+JDzzMtXurMpPkH8p+p8C1OKNFJR3CrzLVS
 FVfuoo9JTYqwRjLvvDqFndWd+oZvRyVmswkNAi5IJM8KEZ620l00He5c/WifgpGzlYV4
 oWv8k3n+afzDwYi/C5BrUI87/WWRNG/lyxs54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684859690; x=1687451690;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7BQXLdFOI2CGu/rfEBqigmE78qgmnNYZiqsFoyv3xq0=;
 b=L0d2Ei5tjPgMfncq3jNeAKT4ukmILQlBSsy5rI6MyuO2UboOX6mPi6rGDrSftcrzIQ
 5v6DZ4kw3Rl4vMd6kyf604yRpilEybw+NlpGhEq7MLhwD9QXm2ygPmR+OSVrGAGFqwXg
 ZHXxsXlSpbAzqI/LtNcuaTAb1aE09leK7LmmH17GcfetDKNRI7tWhySGiBQkcT/mS+gF
 mUj0xcb/mlwDHzuBS304NI7h61Jx3BTFUcvvJna4hkrd4NfTI6oCUKD0KFnEPSW/I6wr
 jNQN62ypj4XGhWVQZp7VIpWBwqm4cIHMKVX4CG9wgOb9yNtZ1iB203vJxVM5GFw/rZKd
 xT/Q==
X-Gm-Message-State: AC+VfDzEzoKsJ3pgdBMbC79TlhmCsjqLriun5Z5JFI83D1/F8XiPBr4B
 ZamNu8ENJNNgqYjBWARKbNvWSwwBuAjxdeGQs/Q=
X-Google-Smtp-Source: ACHHUZ7XSRI2RLNKpZHEMFtWYZsrHL3CAvMC2h4896Gl2ywiS1fajKLKL54bxJaczbTrZbkusC6OVA==
X-Received: by 2002:a6b:5c0e:0:b0:76c:542f:d72d with SMTP id
 z14-20020a6b5c0e000000b0076c542fd72dmr9256834ioh.8.1684859690698; 
 Tue, 23 May 2023 09:34:50 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com.
 [209.85.166.182]) by smtp.gmail.com with ESMTPSA id
 a23-20020a5d89d7000000b0076c569c7a48sm2682903iot.39.2023.05.23.09.34.49
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 May 2023 09:34:50 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-33828a86ee2so202685ab.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 23 May 2023 09:34:49 -0700 (PDT)
X-Received: by 2002:a05:6e02:1a42:b0:32a:642d:2a13 with SMTP id
 u2-20020a056e021a4200b0032a642d2a13mr379303ilv.6.1684859689295; Tue, 23 May
 2023 09:34:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
 <20230519101840.v5.10.I3a7d4dd8c23ac30ee0b607d77feb6646b64825c0@changeid>
 <ZGzjm9h85fpYZJMc@alley>
In-Reply-To: <ZGzjm9h85fpYZJMc@alley>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 23 May 2023 09:34:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VeGKTvw2=qhSqkSEtYwVrXGLNzNbgBAwrmn2CWWfJckQ@mail.gmail.com>
Message-ID: <CAD=FV=VeGKTvw2=qhSqkSEtYwVrXGLNzNbgBAwrmn2CWWfJckQ@mail.gmail.com>
To: Petr Mladek <pmladek@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Tue, May 23, 2023 at 9:02 AM Petr Mladek <pmladek@suse.com>
    wrote: > > On Fri 2023-05-19 10:18:34, Douglas Anderson wrote: > > In preparation
    for the buddy hardlockup detector where the CPU > > c [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.166.50 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.166.50 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q1UyO-0007Ay-Te
Subject: Re: [Kgdb-bugreport] [PATCH v5 10/18] watchdog/hardlockup: Add a
 "cpu" param to watchdog_hardlockup_check()
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 ito-yuichi@fujitsu.com, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 Marc Zyngier <maz@kernel.org>, christophe.leroy@csgroup.eu,
 Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com,
 Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com,
 Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 mpe@ellerman.id.au, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBUdWUsIE1heSAyMywgMjAyMyBhdCA5OjAy4oCvQU0gUGV0ciBNbGFkZWsgPHBtbGFk
ZWtAc3VzZS5jb20+IHdyb3RlOgo+Cj4gT24gRnJpIDIwMjMtMDUtMTkgMTA6MTg6MzQsIERvdWds
YXMgQW5kZXJzb24gd3JvdGU6Cj4gPiBJbiBwcmVwYXJhdGlvbiBmb3IgdGhlIGJ1ZGR5IGhhcmRs
b2NrdXAgZGV0ZWN0b3Igd2hlcmUgdGhlIENQVQo+ID4gY2hlY2tpbmcgZm9yIGxvY2t1cCBtaWdo
dCBub3QgYmUgdGhlIGN1cnJlbnRseSBydW5uaW5nIENQVSwgYWRkIGEKPiA+ICJjcHUiIHBhcmFt
ZXRlciB0byB3YXRjaGRvZ19oYXJkbG9ja3VwX2NoZWNrKCkuCj4gPgo+ID4gQXMgcGFydCBvZiB0
aGlzIGNoYW5nZSwgbWFrZSBocnRpbWVyX2ludGVycnVwdHMgYW4gYXRvbWljX3Qgc2luY2Ugbm93
Cj4gPiB0aGUgQ1BVIGluY3JlbWVudGluZyB0aGUgdmFsdWUgYW5kIHRoZSBDUFUgcmVhZGluZyB0
aGUgdmFsdWUgbWlnaHQgYmUKPiA+IGRpZmZlcmVudC4gVGVjaG5pYWxseSB0aGlzIGNvdWxkIGFs
c28gYmUgZG9uZSB3aXRoIGp1c3QgUkVBRF9PTkNFIGFuZAo+ID4gV1JJVEVfT05DRSwgYnV0IGF0
b21pY190IGZlZWxzIGEgbGl0dGxlIGNsZWFuZXIgaW4gdGhpcyBjYXNlLgo+ID4KPiA+IFdoaWxl
IGhydGltZXJfaW50ZXJydXB0cyBpcyBtYWRlIGF0b21pY190LCB3ZSBjaGFuZ2UKPiA+IGhydGlt
ZXJfaW50ZXJydXB0c19zYXZlZCBmcm9tICJ1bnNpZ25lZCBsb25nIiB0byAiaW50Ii4gVGhlICJp
bnQiIGlzCj4gPiBuZWVkZWQgdG8gbWF0Y2ggdGhlIGRhdGEgdHlwZSBiYWNraW5nIGF0b21pY190
IGZvciBocnRpbWVyX2ludGVycnVwdHMuCj4gPiBFdmVuIGlmIHRoaXMgY2hhbmdlcyB1cyBmcm9t
IDY0LWJpdHMgdG8gMzItYml0cyAod2hpY2ggSSBkb24ndCB0aGluawo+ID4gaXMgdHJ1ZSBmb3Ig
bW9zdCBjb21waWxlcnMpLCBpdCBkb2Vzbid0IHJlYWxseSBtYXR0ZXIuIEFsbCB3ZSBldmVyIGRv
Cj4gPiBpcyBpbmNyZW1lbnQgaXQgZXZlcnkgZmV3IHNlY29uZHMgYW5kIGNvbXBhcmUgaXQgdG8g
YW4gb2xkIHZhbHVlIHNvCj4gPiAzMi1iaXRzIGlzIGZpbmUgKGV2ZW4gMTYtYml0cyB3b3VsZCBi
ZSkuIFRoZSAic2lnbmVkIiB2cyAidW5zaWduZWQiCj4gPiBhbHNvIGRvZXNuJ3QgbWF0dGVyIGZv
ciBzaW1wbGUgZXF1YWxpdHkgY29tcGFyaXNvbnMuCj4gPgo+ID4gaHJ0aW1lcl9pbnRlcnJ1cHRz
X3NhdmVkIGlzIF9ub3RfIHN3aXRjaGVkIHRvIGF0b21pY190IG5vciBldmVuCj4gPiBhY2Nlc3Nl
ZCB3aXRoIFJFQURfT05DRSAvIFdSSVRFX09OQ0UuIFRoZSBocnRpbWVyX2ludGVycnVwdHNfc2F2
ZWQgaXMKPiA+IGFsd2F5cyBjb25zaXN0ZW50bHkgYWNjZXNzZWQgd2l0aCB0aGUgc2FtZSBDUFUu
IE5PVEU6IHdpdGggdGhlCj4gPiB1cGNvbWluZyAiYnVkZHkiIGRldGVjdG9yIHRoZXJlIGlzIG9u
ZSBzcGVjaWFsIGNhc2UuIFdoZW4gYSBDUFUgZ29lcwo+ID4gb2ZmbGluZS9vbmxpbmUgdGhlbiB3
ZSBjYW4gY2hhbmdlIHdoaWNoIENQVSBpcyB0aGUgb25lIHRvIGNvbnNpc3RlbnRseQo+ID4gYWNj
ZXNzIGEgZ2l2ZW4gaW5zdGFuY2Ugb2YgaHJ0aW1lcl9pbnRlcnJ1cHRzX3NhdmVkLiBXZSBzdGls
bCBjYW4ndAo+ID4gZW5kIHVwIHdpdGggYSBwYXJ0aWFsbHkgdXBkYXRlZCBocnRpbWVyX2ludGVy
cnVwdHNfc2F2ZWQsIGhvd2V2ZXIsCj4gPiBiZWNhdXNlIHdlIGVuZCB1cCBwZXR0aW5nIGFsbCBh
ZmZlY3RlZCBDUFVzIHRvIG1ha2Ugc3VyZSB0aGUgbmV3IGFuZAo+ID4gb2xkIENQVSBjYW4ndCBl
bmQgdXAgc29tZWhvdyByZWFkL3dyaXRlIGhydGltZXJfaW50ZXJydXB0c19zYXZlZCBhdAo+ID4g
dGhlIHNhbWUgdGltZS4KPiA+Cj4gPiAtLS0gYS9rZXJuZWwvd2F0Y2hkb2cuYwo+ID4gKysrIGIv
a2VybmVsL3dhdGNoZG9nLmMKPiA+IEBAIC04NywyOSArODcsMzQgQEAgX19zZXR1cCgibm1pX3dh
dGNoZG9nPSIsIGhhcmRsb2NrdXBfcGFuaWNfc2V0dXApOwo+ID4KPiA+ICAjaWYgZGVmaW5lZChD
T05GSUdfSEFSRExPQ0tVUF9ERVRFQ1RPUl9QRVJGKQo+ID4KPiA+IC1zdGF0aWMgREVGSU5FX1BF
Ul9DUFUodW5zaWduZWQgbG9uZywgaHJ0aW1lcl9pbnRlcnJ1cHRzKTsKPiA+IC1zdGF0aWMgREVG
SU5FX1BFUl9DUFUodW5zaWduZWQgbG9uZywgaHJ0aW1lcl9pbnRlcnJ1cHRzX3NhdmVkKTsKPiA+
ICtzdGF0aWMgREVGSU5FX1BFUl9DUFUoYXRvbWljX3QsIGhydGltZXJfaW50ZXJydXB0cyk7Cj4g
PiArc3RhdGljIERFRklORV9QRVJfQ1BVKGludCwgaHJ0aW1lcl9pbnRlcnJ1cHRzX3NhdmVkKTsK
PiA+ICBzdGF0aWMgREVGSU5FX1BFUl9DUFUoYm9vbCwgd2F0Y2hkb2dfaGFyZGxvY2t1cF93YXJu
ZWQpOwo+ID4gIHN0YXRpYyB1bnNpZ25lZCBsb25nIHdhdGNoZG9nX2hhcmRsb2NrdXBfYWxsX2Nw
dV9kdW1wZWQ7Cj4gPgo+ID4gLXN0YXRpYyBib29sIGlzX2hhcmRsb2NrdXAodm9pZCkKPiA+ICtz
dGF0aWMgYm9vbCBpc19oYXJkbG9ja3VwKHVuc2lnbmVkIGludCBjcHUpCj4gPiAgewo+ID4gLSAg
ICAgdW5zaWduZWQgbG9uZyBocmludCA9IF9fdGhpc19jcHVfcmVhZChocnRpbWVyX2ludGVycnVw
dHMpOwo+ID4gKyAgICAgaW50IGhyaW50ID0gYXRvbWljX3JlYWQoJnBlcl9jcHUoaHJ0aW1lcl9p
bnRlcnJ1cHRzLCBjcHUpKTsKPiA+Cj4gPiAtICAgICBpZiAoX190aGlzX2NwdV9yZWFkKGhydGlt
ZXJfaW50ZXJydXB0c19zYXZlZCkgPT0gaHJpbnQpCj4gPiArICAgICBpZiAocGVyX2NwdShocnRp
bWVyX2ludGVycnVwdHNfc2F2ZWQsIGNwdSkgPT0gaHJpbnQpCj4gPiAgICAgICAgICAgICAgIHJl
dHVybiB0cnVlOwo+ID4KPiA+IC0gICAgIF9fdGhpc19jcHVfd3JpdGUoaHJ0aW1lcl9pbnRlcnJ1
cHRzX3NhdmVkLCBocmludCk7Cj4gPiArICAgICAvKgo+ID4gKyAgICAgICogTk9URTogd2UgZG9u
J3QgbmVlZCBhbnkgZmFuY3kgYXRvbWljX3Qgb3IgUkVBRF9PTkNFL1dSSVRFX09OQ0UKPiA+ICsg
ICAgICAqIGZvciBocnRpbWVyX2ludGVycnVwdHNfc2F2ZWQuIGhydGltZXJfaW50ZXJydXB0c19z
YXZlZCBpcwo+ID4gKyAgICAgICogd3JpdHRlbi9yZWFkIGJ5IGEgc2luZ2xlIENQVS4KPiA+ICsg
ICAgICAqLwo+ID4gKyAgICAgcGVyX2NwdShocnRpbWVyX2ludGVycnVwdHNfc2F2ZWQsIGNwdSkg
PSBocmludDsKPiA+Cj4gPiAgICAgICByZXR1cm4gZmFsc2U7Cj4gPiAgfQo+ID4KPiA+ICBzdGF0
aWMgdm9pZCB3YXRjaGRvZ19oYXJkbG9ja3VwX2tpY2sodm9pZCkKPiA+ICB7Cj4gPiAtICAgICBf
X3RoaXNfY3B1X2luYyhocnRpbWVyX2ludGVycnVwdHMpOwo+ID4gKyAgICAgYXRvbWljX2luYyhy
YXdfY3B1X3B0cigmaHJ0aW1lcl9pbnRlcnJ1cHRzKSk7Cj4KPiBJcyB0aGVyZSBhbnkgcGFydGlj
dWxhciByZWFzb24gd2h5IHJhd18qKCkgaXMgbmVlZGVkLCBwbGVhc2U/Cj4KPiBNeSBleHBlY3Rh
dGlvbiBpcyB0aGF0IHRoZSByYXdfIEFQSSBzaG91bGQgYmUgdXNlZCBvbmx5IHdoZW4KPiB0aGVy
ZSBpcyBhIGdvb2QgcmVhc29uIGZvciBpdC4gV2hlcmUgYSBnb29kIHJlYXNvbiBtaWdodCBiZQo+
IHdoZW4gdGhlIGNoZWNrcyBtaWdodCBmYWlsIGJ1dCB0aGUgY29uc2lzdGVuY3kgaXMgZ3VhcmFu
dGVlZAo+IGFub3RoZXIgd2F5Lgo+Cj4gSU1ITywgd2Ugc2hvdWxkIHVzZToKPgo+ICAgICAgICAg
YXRvbWljX2luYyh0aGlzX2NwdV9wdHIoJmhydGltZXJfaW50ZXJydXB0cykpOwo+Cj4gVG8gYmUg
aG9uZXN0LCBJIGFtIGEgYml0IGxvc3QgaW4gdGhlIHBlcl9jcHUgQVBJIGRlZmluaXRpb25zLgo+
Cj4gQnV0IHRoaXNfY3B1X3B0cigpIHNlZW1zIHRvIGJlIGltcGxlbWVudGVkIHRoZSBzYW1lIHdh
eSBhcwo+IHBlcl9jcHVfcHRyKCkgd2hlbiBDT05GSUdfREVCVUdfUFJFRU1QVCBpcyBlbmFibGVk
Lgo+IEFuZCB3ZSB1c2UgcGVyX2NwdV9wdHIoKSBpbiBpc19oYXJkbG9ja3VwKCkuCj4KPiBBbHNv
IHRoaXNfY3B1X3B0cigpIGlzIHVzZWQgbW9yZSBjb21tb25seToKPgo+ICQ+IGdpdCBncmVwIHRo
aXNfY3B1X3B0ciB8IHdjIC1sCj4gMTM4NQo+ICQ+IGdpdCBncmVwIHJhd19jcHVfcHRyIHwgd2Mg
LWwKPiAxMTQKCkhtbW0sIEkgdGhpbmsgbWF5YmUgSSBjb25mdXNlZCBteXNlbGYuIFRoZSBvbGQg
Y29kZSBwdXJwb3NlbHkgdXNlZCB0aGUKZG91YmxlLXVuZGVyc2NvcmUgcHJlZml4ZWQgdmVyc2lv
biBvZiB0aGlzX2NwdV9pbmMoKS4gSSBjb3VsZG4ndCBmaW5kCmEgZG91YmxlLXVuZGVyc2NvcmUg
dmVyc2lvbiBvZiB0aGlzX2NwdV9wdHIoKSBhbmQgSSBzb21laG93IGNvbnZpbmNlZApteXNlbGYg
dGhhdCB0aGUgcmF3KCkgdmVyc2lvbiB3YXMgdGhlIHJpZ2h0IGVxdWl2YWxlbnQgdmVyc2lvbi4K
CllvdSdyZSByaWdodCB0aGF0IHRoaXNfY3B1X3B0cigpIGlzIGEgYmV0dGVyIGNob2ljZSBoZXJl
IGFuZCBJIGRvbid0CnNlZSBhbnkgcmVhc29uIHdoeSB3ZSdkIG5lZWQgdGhlIHJhdyB2ZXJzaW9u
LgoKPiA+ICB9Cj4gPgo+ID4gLXZvaWQgd2F0Y2hkb2dfaGFyZGxvY2t1cF9jaGVjayhzdHJ1Y3Qg
cHRfcmVncyAqcmVncykKPiA+ICt2b2lkIHdhdGNoZG9nX2hhcmRsb2NrdXBfY2hlY2sodW5zaWdu
ZWQgaW50IGNwdSwgc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPiAgewo+ID4gICAgICAgLyoKPiA+
ICAgICAgICAqIENoZWNrIGZvciBhIGhhcmRsb2NrdXAgYnkgbWFraW5nIHN1cmUgdGhlIENQVSdz
IHRpbWVyCj4gPiBAQCAtMTE3LDM1ICsxMjIsNDIgQEAgdm9pZCB3YXRjaGRvZ19oYXJkbG9ja3Vw
X2NoZWNrKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ID4gICAgICAgICogZmlyZWQgbXVsdGlwbGUg
dGltZXMgYmVmb3JlIHdlIG92ZXJmbG93J2QuIElmIGl0IGhhc24ndAo+ID4gICAgICAgICogdGhl
biB0aGlzIGlzIGEgZ29vZCBpbmRpY2F0aW9uIHRoZSBjcHUgaXMgc3R1Y2sKPiA+ICAgICAgICAq
Lwo+ID4gLSAgICAgaWYgKGlzX2hhcmRsb2NrdXAoKSkgewo+ID4gKyAgICAgaWYgKGlzX2hhcmRs
b2NrdXAoY3B1KSkgewo+ID4gICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgdGhpc19jcHUgPSBz
bXBfcHJvY2Vzc29yX2lkKCk7Cj4gPiArICAgICAgICAgICAgIHN0cnVjdCBjcHVtYXNrIGJhY2t0
cmFjZV9tYXNrID0gKmNwdV9vbmxpbmVfbWFzazsKPgo+IERvZXMgdGhpcyB3b3JrLCBwbGVhc2U/
Cj4KPiBJTUhPLCB3ZSBzaG91bGQgdXNlIGNwdW1hc2tfY29weSgpLgoKQWgsIGdvb2QgY2FsbCwg
dGhhbmtzIQoKCj4gPiAgICAgICAgICAgICAgIC8qIE9ubHkgcHJpbnQgaGFyZGxvY2t1cHMgb25j
ZS4gKi8KPiA+IC0gICAgICAgICAgICAgaWYgKF9fdGhpc19jcHVfcmVhZCh3YXRjaGRvZ19oYXJk
bG9ja3VwX3dhcm5lZCkpCj4gPiArICAgICAgICAgICAgIGlmIChwZXJfY3B1KHdhdGNoZG9nX2hh
cmRsb2NrdXBfd2FybmVkLCBjcHUpKQo+ID4gICAgICAgICAgICAgICAgICAgICAgIHJldHVybjsK
PiA+Cj4KPiBPdGhlcndpc2UsIGl0IGxvb2tzIGdvb2QgdG8gbWUuCgpOZWl0aGVyIGNoYW5nZSBz
ZWVtcyB1cmdlbnQgdGhvdWdoIGJvdGggYXJlIGltcG9ydGFudCB0byBmaXgsIEknbGwKd2FpdCBh
IGRheSBvciB0d28gdG8gc2VlIGlmIHlvdSBoYXZlIGZlZWRiYWNrIG9uIGFueSBvZiB0aGUgb3Ro
ZXIKcGF0Y2hlcyBhbmQgSSdsbCBzZW5kIGEgZml4dXAgc2VyaWVzLgoKLURvdWcKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBt
YWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
